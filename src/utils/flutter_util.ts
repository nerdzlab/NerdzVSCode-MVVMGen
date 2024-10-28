import { exec } from 'child_process';
import * as vscode from 'vscode';
import * as fs from 'fs';
import * as path from 'path';
import * as yaml from 'js-yaml';

export function checkIfFlutterInstalled(): Promise<void> {
    return runCommand('flutter --version')
}
export function generateL10n(directory: string): Promise<void> {
    return runCommand('flutter gen-l10n', directory)
}
export function getFlutterDependencies(directory: string): Promise<void> {
    return runCommand('flutter pub get', directory)
}
export function createFlutterProject(directory: string, projectName: string): Promise<void> {
    return runCommand(`flutter create ${projectName} -e --platforms=android,ios`, directory)
}

function runCommand(command: string, cwd?: string): Promise<void> {
    const options = cwd ? { cwd } : {};
    return new Promise((resolve, reject) => {
        exec(command, options, (error, stdout, stderr) => {
            if (error) {
                reject(stderr);
            } else {
                resolve();
            }
        });
    });
}

export function getFlutterProjectName(): string | undefined {
    const workspaceFolders = vscode.workspace.workspaceFolders;

    if (!workspaceFolders || workspaceFolders.length === 0) {
        vscode.window.showErrorMessage('No workspace folder is open.');
        return;
    }

    // Assuming the pubspec.yaml is in the root of the workspace
    const pubspecPath = path.join(workspaceFolders[0].uri.fsPath, 'pubspec.yaml');

    // Check if the file exists
    if (!fs.existsSync(pubspecPath)) {
        vscode.window.showErrorMessage('pubspec.yaml not found in the workspace.');
        return;
    }

    try {
        // Read and parse the pubspec.yaml file
        const fileContent = fs.readFileSync(pubspecPath, 'utf8');
        const pubspec = yaml.load(fileContent) as { name?: string };

        // Return the project name if it exists
        if (pubspec && pubspec.name) {
            return pubspec.name;
        } else {
            vscode.window.showErrorMessage('No "name" field found in pubspec.yaml.');
        }
    } catch (error) {
        vscode.window.showErrorMessage(`Error reading pubspec.yaml: ${error}`);
    }

    return;
}

export function getARBFiles(): string[] | undefined {
    const workspaceFolders = vscode.workspace.workspaceFolders;

    if (!workspaceFolders || workspaceFolders.length === 0) {
        vscode.window.showErrorMessage('No workspace folder is open.');
        return;
    }

    // Assuming the pubspec.yaml is in the root of the workspace
    const yamlPath = path.join(workspaceFolders[0].uri.fsPath, 'l10n.yaml');

    if (!fs.existsSync(yamlPath)) {
        vscode.window.showErrorMessage("l10n.yaml file not found in the workspace.");
        return;
    }

    const yamlContent = yaml.load(fs.readFileSync(yamlPath, 'utf-8')) as { 'arb-dir': string };
    const arbDirectory = yamlContent?.['arb-dir'] ? path.join(workspaceFolders[0].uri.fsPath, yamlContent['arb-dir']) : null;

    if (!arbDirectory || !fs.existsSync(arbDirectory)) {
        vscode.window.showErrorMessage("ARB directory specified in l10n.yaml does not exist.");
        return;
    }

    // Find .arb files in the ARB directory
    const arbFiles = fs.readdirSync(arbDirectory)
        .filter(file => file.endsWith('.arb'))
        .map(file => path.join(arbDirectory, file));

    if (arbFiles.length === 0) {
        vscode.window.showErrorMessage("No ARB files found in the specified directory.");
        return;
    }

    return arbFiles;
}