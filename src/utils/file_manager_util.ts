import * as fs from 'fs';
import * as path from 'path';

export function copyFiles(srcDir: string, destDir: string) {
    if (!fs.existsSync(srcDir)) return;

    fs.readdirSync(srcDir).forEach(file => {
        const srcFile = path.join(srcDir, file);
        const destFile = path.join(destDir, file);

        if (fs.lstatSync(srcFile).isDirectory()) {
            fs.mkdirSync(destFile, { recursive: true });
            copyFiles(srcFile, destFile);
        } else {
            fs.copyFileSync(srcFile, destFile);
        }
    });
}

export function replaceInDirectory(dirPath: string, searchValue: string, replaceValue: string) {
    const files = fs.readdirSync(dirPath);

    files.forEach(file => {
        const filePath = path.join(dirPath, file);

        if (fs.lstatSync(filePath).isDirectory()) {
            // Recursively handle subdirectories
            replaceInDirectory(filePath, searchValue, replaceValue);
        } else if (filePath.endsWith('.dart') || filePath.endsWith('.yaml') || filePath.endsWith('.gradle')) {
            // Only replace in .dart files
            const fileContent = fs.readFileSync(filePath, 'utf8');
            const updatedContent = fileContent.split(searchValue).join(replaceValue);

            // Write the updated content back to the file
            fs.writeFileSync(filePath, updatedContent, 'utf8');
        }
    });
}