export function getDefaultViewModelType(pascalCaseViewModelTypeName: string, packageName: string) {
    return `import 'package:${packageName}/presentation_layer/general/base/loading_view_model.dart';
    
abstract class ${pascalCaseViewModelTypeName}ScreenViewModelType extends LoadingViewModel {}
`;
}

