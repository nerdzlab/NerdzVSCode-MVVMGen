import _ from "lodash";
import * as path from 'path';

import { Uri, window, commands } from "vscode";

import {
    checkIfFlutterInstalled,
    copyFiles,
    createFlutterProject,
    getFlutterDependencies,
    promptForName,
    promptForTargetDirectory,
    removeIOsDefaultRunner,
    replaceIdentifierForPbxproj,
    replaceInDirectoryIdentifier,
    replaceInDirectoryIosProjectFile,
    updateGitignoreFile,
    validProjectNamePattern
} from "../utils";

export const newProject = async (extensionPath: string) => {
    // Prompt for directory
    const targetDirectory = await promptForTargetDirectory("Select a folder to create the Project in");
    if (_.isNil(targetDirectory)) {
        window.showErrorMessage("Please select a valid directory");
        return;
    }

    // Prompt for project name
    const viewModelProjectName = await promptForName("Enter project name", "ProjectName");
    if (_.isNil(viewModelProjectName) || viewModelProjectName.trim() === "") {
        window.showErrorMessage("The project name must not be empty");
        return;
    } else if (!validProjectNamePattern.test(viewModelProjectName)) {
        window.showErrorMessage("The project name should contain only lowercase letters, digits, and underscores");
        return;
    }

    try {
        await checkIfFlutterInstalled();
        await createFlutterProject(targetDirectory, viewModelProjectName);

        const templateDir = path.join(extensionPath, 'assets', 'project_template');
        const projectDirectory = path.join(targetDirectory, viewModelProjectName)
        copyFiles(templateDir, projectDirectory)

        replaceInDirectoryIosProjectFile(projectDirectory, extensionPath)
        removeIOsDefaultRunner(projectDirectory)

        const changeCase = await import("change-case");
        const camelCaseText = changeCase.camelCase(viewModelProjectName).replaceAll('_', '');
        replaceIdentifierForPbxproj(projectDirectory, 'VIEW_MODEL_PROJECT_IDENTIFIER_QW32', camelCaseText)
        
        replaceInDirectoryIdentifier(projectDirectory, 'VIEW_MODEL_PROJECT_IDENTIFIER_QW32', viewModelProjectName)
        updateGitignoreFile(projectDirectory)

        const uri = Uri.file(projectDirectory);
        await commands.executeCommand('vscode.openFolder', uri, true);

        getFlutterDependencies(projectDirectory);
        commands.executeCommand('workbench.action.closeWindow');

    } catch (error) {
        window.showErrorMessage(
            `Error:
            ${error instanceof Error ? error.message : JSON.stringify(error)}`
        );
    }
}


