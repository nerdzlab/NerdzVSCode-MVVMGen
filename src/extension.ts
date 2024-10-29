import * as vscode from 'vscode';
import { extractToARB, newProject, newViewModel } from './commands/index'
import { ExtractToARBProvider } from './code-actions';

export function activate(context: vscode.ExtensionContext) {
	console.log('Extension "mvvm-flutter" is now active!');

	context.subscriptions.push(
		// New ViewModel files
		vscode.commands.registerCommand('mvvm-flutter.new-view-model', newViewModel),

		// New Project
		vscode.commands.registerCommand('mvvm-flutter.new-project',
			() => newProject(context.extensionPath)),

		// Extract to ARB
		vscode.commands.registerCommand('mvvm-flutter.extract-to-arb', extractToARB),
		vscode.languages.registerCodeActionsProvider(
			{ language: 'dart', scheme: 'file' },
			new ExtractToARBProvider(),
			{ providedCodeActionKinds: ExtractToARBProvider.providedCodeActionKinds }),
	);
}

export function deactivate() { }
