export function getDefaultViewModelRouteType(pascalCaseViewModelRouteTypeName: string) {
    return `abstract class ${pascalCaseViewModelRouteTypeName}ScreenViewModelRouteType {}
`;
}
