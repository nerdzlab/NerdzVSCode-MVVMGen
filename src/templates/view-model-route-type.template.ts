export function getDefaultViewModelRouteType(pascalCaseViewModelRouteTypeName: string, packageName: string) {
    return `import 'package:${packageName}/presentation_layer/general/base/loading_view_model.dart';

abstract class ${pascalCaseViewModelRouteTypeName}ScreenViewModelRouteType extends LoadingViewModel {}
`;
}
