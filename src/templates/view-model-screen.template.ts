export function getDefaultViewModelScreen(snakeCaseName: string, pascalCaseName: string, packageName: string, stateless: boolean) {
  if (stateless) {
    return `import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '${snakeCaseName}_screen_view_model_type.dart';

import 'package:${packageName}/presentation_layer/general/abstract/base_widget.dart';

final class ${pascalCaseName}Screen extends BaseStatelessWidget {
  ${pascalCaseName}Screen({
    super.key,
    required ${pascalCaseName}ScreenViewModelType viewModel,
  }) : _viewModel = viewModel;

  final ${pascalCaseName}ScreenViewModelType _viewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<${pascalCaseName}ScreenViewModelType>.value(
      value: _viewModel,
      child: Consumer<${pascalCaseName}ScreenViewModelType>(
        builder: (context, viewModel, _) {
          return Scaffold();
        },
      ),
    );
  }
}
`;
  }

  return `import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '${snakeCaseName}_screen_view_model_type.dart';

import 'package:${packageName}/presentation_layer/general/abstract/base_widget.dart';

final class ${pascalCaseName}Screen extends BaseStatefulWidget {
  ${pascalCaseName}Screen({
    super.key,
    required ${pascalCaseName}ScreenViewModelType viewModel,
  }) : _viewModel = viewModel;

  final ${pascalCaseName}ScreenViewModelType _viewModel;

  @override
  State<${pascalCaseName}Screen> createState() =>
      _${pascalCaseName}ScreenState();
}

class _${pascalCaseName}ScreenState extends State<${pascalCaseName}Screen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<${pascalCaseName}ScreenViewModelType>.value(
      value: widget._viewModel,
      child: Consumer<${pascalCaseName}ScreenViewModelType>(
        builder: (context, viewModel, _) {
          return Scaffold();
        },
      ),
    );
  }
}
`;;
}

