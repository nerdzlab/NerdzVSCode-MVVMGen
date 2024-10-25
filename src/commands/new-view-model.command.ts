import * as _ from "lodash";

import {
    Uri,
    window,
    QuickPickItem
} from "vscode";
import { existsSync, lstatSync, writeFile } from "fs";
import { getDefaultViewModel, getDefaultViewModelType, getDefaultViewModelRouteType, getDefaultViewModelScreen } from "../templates/index";
import { getFlutterProjectName } from "../utils/index";

export const newViewModel = async (uri: Uri) => {
    const viewModelName = await promptForViewModelName();

    if (_.isNil(viewModelName) || viewModelName.trim() === "") {
        window.showErrorMessage("The ViewModel name must not be empty");
        return;
    }

    let targetDirectory;
    if (_.isNil(_.get(uri, "fsPath")) || !lstatSync(uri.fsPath).isDirectory()) {
        targetDirectory = await promptForTargetDirectory();
        if (_.isNil(targetDirectory)) {
            window.showErrorMessage("Please select a valid directory");
            return;
        }
    } else {
        targetDirectory = uri.fsPath;
    }

    const isStatelessWidgetType = await promptForIfStatelessWidgetType();

    if (isStatelessWidgetType == null) {
        window.showErrorMessage("Please select a valid widget type");
        return;
    }

    const changeCase = await import("change-case");

    const pascalCaseVieModelName = changeCase.pascalCase(viewModelName);
    const projectName = await getFlutterProjectName();

    if (projectName == null) {
        window.showErrorMessage(
            `Error:
            Can't get project name`
        );
        return;
    }

    try {
        await generateViewModel(viewModelName, targetDirectory, projectName, isStatelessWidgetType);
        window.showInformationMessage(
            `Successfully Generated ${pascalCaseVieModelName} ViewModel`
        );
    } catch (error) {
        window.showErrorMessage(
            `Error:
            ${error instanceof Error ? error.message : JSON.stringify(error)}`
        );
    }
}

function promptForViewModelName(): Thenable<string | undefined> {
    const inputOptions = {
        prompt: "Enter ViewModel name",
        placeHolder: "ViewModelName"
    };

    return window.showInputBox(inputOptions);
}

async function promptForIfStatelessWidgetType(): Promise<boolean | null> {
    const options: QuickPickItem[] = [
        { label: 'Stateless', description: 'Create a Stateless Widget' },
        { label: 'Stateful', description: 'Create a Stateful Widget' }
    ];

    const selectedOption = await window.showQuickPick(options, {
        placeHolder: 'Select Widget Type'
    });

    if (!selectedOption) {
        return null;
    }

    return selectedOption.label === 'Stateless';
}

async function promptForTargetDirectory() {
    const options = {
        canSelectMany: false,
        openLabel: "Select a folder to create the ViewModel in",
        canSelectFolders: true,
    };

    return window.showOpenDialog(options).then((uri) => {
        if (_.isNil(uri) || _.isEmpty(uri)) {
            return undefined;
        }
        return uri[0].fsPath;
    });
}

async function generateViewModel(
    viewModelName: string,
    targetDirectory: string,
    projectName: string,
    isStatelessWidgetType: boolean,
) {
    await Promise.all([
        createViewModelTemplate(viewModelName, targetDirectory),
        createViewModelTypeTemplate(viewModelName, targetDirectory, projectName),
        createViewModelRouteTypeTemplate(viewModelName, targetDirectory, projectName),
        createViewModelScreenTemplate(viewModelName, targetDirectory, projectName, isStatelessWidgetType)
    ]);
}

async function createViewModelTemplate(
    viewModelName: string,
    targetDirectory: string
) {
    const changeCase = await import("change-case");
    const snakeCaseViewModelName = changeCase.snakeCase(viewModelName);
    const pascalCaseVieModelName = changeCase.pascalCase(viewModelName);

    const targetPath = `${targetDirectory}/${snakeCaseViewModelName}_screen_view_model.dart`;
    if (existsSync(targetPath)) {
        throw Error(`${snakeCaseViewModelName}_screen_view_model.dart already exists`);
    }
    return new Promise<void>(async (resolve, reject) => {
        writeFile(
            targetPath,
            getDefaultViewModel(snakeCaseViewModelName, pascalCaseVieModelName),
            'utf8',
            (error) => {
                if (error) {
                    reject(error);
                    return;
                }
                resolve();
            }
        );
    });
}

async function createViewModelTypeTemplate(
    viewModelName: string,
    targetDirectory: string,
    projectName: string
) {
    const changeCase = await import("change-case");
    const snakeCaseViewModelName = changeCase.snakeCase(viewModelName);
    const pascalCaseVieModelName = changeCase.pascalCase(viewModelName);

    const targetPath = `${targetDirectory}/${snakeCaseViewModelName}_screen_view_model_type.dart`;
    if (existsSync(targetPath)) {
        throw Error(`${snakeCaseViewModelName}_screen_view_model_type.dart already exists`);
    }
    return new Promise<void>(async (resolve, reject) => {
        writeFile(
            targetPath,
            getDefaultViewModelType(pascalCaseVieModelName, projectName),
            'utf8',
            (error) => {
                if (error) {
                    reject(error);
                    return;
                }
                resolve();
            }
        );
    });
}

async function createViewModelRouteTypeTemplate(
    viewModelName: string,
    targetDirectory: string,
    projectName: string
) {
    const changeCase = await import("change-case");
    const snakeCaseViewModelName = changeCase.snakeCase(viewModelName);
    const pascalCaseVieModelName = changeCase.pascalCase(viewModelName);

    const targetPath = `${targetDirectory}/${snakeCaseViewModelName}_screen_view_model_route_type.dart`;
    if (existsSync(targetPath)) {
        throw Error(`${snakeCaseViewModelName}_screen_view_model_route_type.dart already exists`);
    }
    return new Promise<void>(async (resolve, reject) => {
        writeFile(
            targetPath,
            getDefaultViewModelRouteType(pascalCaseVieModelName, projectName),
            'utf8',
            (error) => {
                if (error) {
                    reject(error);
                    return;
                }
                resolve();
            }
        );
    });
}
async function createViewModelScreenTemplate(
    viewModelName: string,
    targetDirectory: string,
    projectName: string,
    isStatelessWidgetType: boolean
) {
    const changeCase = await import("change-case");
    const snakeCaseViewModelName = changeCase.snakeCase(viewModelName);
    const pascalCaseVieModelName = changeCase.pascalCase(viewModelName);

    const targetPath = `${targetDirectory}/${snakeCaseViewModelName}_screen.dart`;
    if (existsSync(targetPath)) {
        throw Error(`${snakeCaseViewModelName}_screen.dart already exists`);
    }
    return new Promise<void>(async (resolve, reject) => {
        writeFile(
            targetPath,
            getDefaultViewModelScreen(snakeCaseViewModelName, pascalCaseVieModelName, projectName, isStatelessWidgetType),
            'utf8',
            (error) => {
                if (error) {
                    reject(error);
                    return;
                }
                resolve();
            }
        );
    });
}
