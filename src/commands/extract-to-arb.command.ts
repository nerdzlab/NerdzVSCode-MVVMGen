import _ from "lodash";
import { workspace, window, TextDocument, Range } from "vscode";
import * as fs from 'fs';
import * as path from 'path';
import { generateL10n, getARBFiles, promptForName, validARBKey } from "../utils";
import * as yaml from 'js-yaml';

export const extractToARB = async (document: TextDocument, range: Range, selectedText: string) => {
    //
    //  Get text value
    //
    if (!selectedText) {
        const editor = window.activeTextEditor;
        if (!editor) {
            window.showErrorMessage('No active editor found.');
            return;
        }

        const selection = editor.selection;
        const selectedTextFromEditor = editor.document.getText(selection);

        if (!selectedTextFromEditor || selectedTextFromEditor === '""' || selectedTextFromEditor === "''") {
            window.showErrorMessage('No valid text selected for extraction. Please select text that is not empty and not just quotes.');
            return;
        }

        if ((selectedTextFromEditor.startsWith('"') && selectedTextFromEditor.endsWith('"'))
            || (selectedTextFromEditor.startsWith("'") && selectedTextFromEditor.endsWith("'"))) {
            selectedText = editor.document.getText(selection);
        } else {
            window.showErrorMessage("Can't extract. Please select a string enclosed in either single (' ') or double (' \" ') quotes.");
            return;
        }
    }
    else if (selectedText === '""' || selectedText === "''") {
        window.showErrorMessage('No valid text selected for extraction. Please select text that is not empty and not just quotes.');
        return;
    }

    //
    //  Get ARB key
    //
    const formattedText = selectedText.replace(/^['"]|['"]$/g, '');

    const changeCase = await import("change-case");
    const camelCaseText = changeCase.camelCase(formattedText);

    const arbKey = await promptForName("Enter ARB key", 'ARB key', camelCaseText);
    if (_.isNil(arbKey) || arbKey.trim() === "") {
        window.showErrorMessage("ARB key must not be empty");
        return;
    }

    if (!validARBKey.test(arbKey)) {
        window.showErrorMessage("ARB key must start with a lowercase letter and can contain numbers, e.g., exampleKey123");
        return;
    }

    //
    //  Find .arb files in the ARB directory
    //
    const arbFiles = getARBFiles();

    if (!arbFiles || arbFiles.length === 0) {
        window.showErrorMessage("No ARB files found in the specified directory.");
        return;
    }

    //
    //  Add the new value to each ARB file
    //
    const addingRes = await addValueToARBFiles(arbFiles, arbKey, formattedText);
    if (!addingRes) return;

    //
    //  Update selected files
    //
    const editor = window.activeTextEditor;
    if (editor) {
        await editor.edit(editBuilder => {
            editBuilder.replace(range, `context.locale.${arbKey}`);
        });
    }

    try {
        const workspaceFolders = workspace.workspaceFolders;

        if (!workspaceFolders || workspaceFolders.length === 0) {
            window.showErrorMessage('No workspace folder is open.');
            return;
        }
        generateL10n(workspaceFolders[0].uri.fsPath);
    } catch (error) {
        window.showErrorMessage(
            `Error:
                ${error instanceof Error ? error.message : JSON.stringify(error)}`
        );
    }

    window.showInformationMessage(`Added "${arbKey}" to ARB.`);
}


async function addValueToARBFiles(arbFiles: string[], arbKey: string, formattedText: string): Promise<boolean> {
    const newEntry = `"${arbKey}": "${formattedText}"`;
    for (const arbFile of arbFiles) {
        const fileContent = fs.readFileSync(arbFile, 'utf-8');

        let jsonData;
        try {
            jsonData = JSON.parse(fileContent);
        } catch (error) {
            window.showErrorMessage(`Failed to parse ${arbFile} as JSON.`)
            return false;
        }

        if (jsonData.hasOwnProperty(arbKey)) {
            window.showErrorMessage(`The key "${arbKey}" already exists in ${arbFile}.`);
            return false;
        }

        // Add new key-value pair to JSON data
        jsonData[arbKey] = formattedText;

        // Convert JSON back to string and format with commas as needed
        const updatedContent = JSON.stringify(jsonData, null, 2);

        fs.writeFileSync(arbFile, updatedContent, 'utf-8');

    }

    return true
};
