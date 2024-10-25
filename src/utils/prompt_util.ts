import * as _ from "lodash";
import { window } from "vscode";

export function promptForName(prompt: string, placeHolder: string): Thenable<string | undefined> {
    const inputOptions = {
        prompt: prompt,
        placeHolder: placeHolder
    };

    return window.showInputBox(inputOptions);
}

export async function promptForTargetDirectory(openLabel: string) {
    const options = {
        canSelectMany: false,
        openLabel: openLabel,
        canSelectFolders: true,
    };

    return window.showOpenDialog(options).then((uri) => {
        if (_.isNil(uri) || _.isEmpty(uri)) {
            return undefined;
        }
        return uri[0].fsPath;
    });
}