import * as vscode from 'vscode';

export class ExtractToARBProvider implements vscode.CodeActionProvider {
    static readonly providedCodeActionKinds = [
        vscode.CodeActionKind.RefactorExtract
    ];

    // Provide code actions when there's selected text
    provideCodeActions(
        document: vscode.TextDocument,
        range: vscode.Range,
        context: vscode.CodeActionContext,
        token: vscode.CancellationToken
    ): vscode.CodeAction[] | undefined {
        const selectedText = document.getText(range);

        // Check if the selected text is surrounded by double quotes, indicating it's a string
        if ((selectedText.startsWith('"') && selectedText.endsWith('"'))
            || (selectedText.startsWith("'") && selectedText.endsWith("'"))) {
            const action = new vscode.CodeAction('Extract to ARB', vscode.CodeActionKind.RefactorExtract);
            action.command = {
                command: 'mvvm-flutter.extract-to-arb',
                title: 'Extract to ARB',
                arguments: [document, range, selectedText]
            };
            return [action];
        }
        return;
    }
}