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

export function replaceInDirectoryIdentifier(dirPath: string, searchValue: string, replaceValue: string) {
    const files = fs.readdirSync(dirPath);

    files.forEach(file => {
        const filePath = path.join(dirPath, file);

        if (fs.lstatSync(filePath).isDirectory()) {
            // Recursively handle subdirectories
            replaceInDirectoryIdentifier(filePath, searchValue, replaceValue);
        } else if (filePath.endsWith('.dart') || filePath.endsWith('.yaml')
            || filePath.endsWith('.gradle')) {
            // Only replace in .dart files
            const fileContent = fs.readFileSync(filePath, 'utf8');
            const updatedContent = fileContent.split(searchValue).join(replaceValue);

            // Write the updated content back to the file
            fs.writeFileSync(filePath, updatedContent, 'utf8');
        }
    });
}

export function replaceIdentifierForPbxproj(dirPath: string, searchValue: string, replaceValue: string) {
    const pbxprojPath = path.join(dirPath, 'ios', 'Runner.xcodeproj', 'project.pbxproj');

    const fileContent = fs.readFileSync(pbxprojPath, 'utf8');
    const updatedContent = fileContent.split(searchValue).join(replaceValue);

    // Write the updated content back to the file
    fs.writeFileSync(pbxprojPath, updatedContent, 'utf8');
}

// Utility function to escape special characters in regex pattern
function escapeRegExp(string: string) {
    return string.replace(/[.*+?^=!:${}()|\[\]\/\\]/g, '\\$&'); // Escape all special characters
}

export function replaceInDirectoryIosProjectFile(dirPath: string, extensionPath: string) {
    const pbxprojPath = path.join(dirPath, 'ios', 'Runner.xcodeproj', 'project.pbxproj');

    // Synchronously read the project.pbxproj file
    const data = fs.readFileSync(pbxprojPath, 'utf-8');

    // Define the strings to locate
    const beginXCBuildConfigSection = '/* Begin XCBuildConfiguration section */';
    const beginXCConfigListSection = '/* Begin XCConfigurationList section */';
    const endXCConfigListSection = '/* End XCConfigurationList section */';

    // Define the path to the build configuration file
    const pathBuildConfiguration = path.join(extensionPath, 'assets', 'pbxproj', 'pbxproj_build_configuration.txt');

    // Synchronously read the pbxproj_build_configuration.txt file
    const buildConfigurationData = fs.readFileSync(pathBuildConfiguration, 'utf-8');

    // Insert the content of pbxproj_build_configuration.txt after the 'Begin XCBuildConfiguration section'
    const updatedData = data.replace(
        beginXCBuildConfigSection,
        `${beginXCBuildConfigSection}\n${buildConfigurationData}`
    );

    // Define the path to the configuration list file
    const pathToConfigurationList = path.join(extensionPath, 'assets', 'pbxproj', 'pbxproj_configuration_list.txt');

    // Synchronously read the pbxproj_configuration_list.txt file
    const configurationListData = fs.readFileSync(pathToConfigurationList, 'utf-8');

    // Replace the XCConfigurationList section
    const newData = updatedData.replace(
        new RegExp(`${escapeRegExp(beginXCConfigListSection)}[\\s\\S]*?${escapeRegExp(endXCConfigListSection)}`, 'g'),
        `${beginXCConfigListSection}\n${configurationListData}\n${endXCConfigListSection}`
    );

    // Synchronously write the updated content back to the project.pbxproj file
    fs.writeFileSync(pbxprojPath, newData, 'utf-8');

    // 
}

export function removeIOsDefaultRunner(dirPath: string) {
    fs.unlinkSync(path.join(dirPath, 'ios', 'Runner.xcodeproj',
        'xcshareddata', 'xcschemes', 'Runner.xcscheme'))
}