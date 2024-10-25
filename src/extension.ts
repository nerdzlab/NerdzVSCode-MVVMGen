import * as vscode from 'vscode';
import { newProject, newViewModel } from './commands/index'

export function activate(context: vscode.ExtensionContext) {
	console.log('Extension "mvvm-flutter" is now active!');

	context.subscriptions.push(
		vscode.commands.registerCommand('mvvm-flutter.new-view-model', newViewModel),
		vscode.commands.registerCommand('mvvm-flutter.new-project',
			() => newProject(context.extensionPath))
	);
}

export function deactivate() { }
