export function getDefaultViewModel(snakeCaseViewModelName: string, pascalCaseViewModelName: string) {
    return `import '${snakeCaseViewModelName}_screen_view_model_type.dart';
import '${snakeCaseViewModelName}_screen_view_model_route_type.dart';

final class ${pascalCaseViewModelName}ScreenViewModel extends ${pascalCaseViewModelName}ScreenViewModelType
    implements ${pascalCaseViewModelName}ScreenViewModelRouteType {
  ${pascalCaseViewModelName}ScreenViewModel();
}
`;
}
