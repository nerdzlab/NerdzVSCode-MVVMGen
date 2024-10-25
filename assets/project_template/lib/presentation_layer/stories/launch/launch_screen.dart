import 'package:focus_detector/focus_detector.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/extensions/theme_extension.dart';
import 'package:provider/provider.dart';

import '../../general/base/base_imports.dart';
import 'launch_screen_view_model_type.dart';

final class LaunchScreen extends StatefulWidget {
  const LaunchScreen({
    super.key,
    required LaunchScreenViewModelType viewModel,
  }) : _viewModel = viewModel;

  final LaunchScreenViewModelType _viewModel;

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget._viewModel.viewDidAppear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LaunchScreenViewModelType>.value(
      value: widget._viewModel,
      child: Consumer<LaunchScreenViewModelType>(
        builder: (context, viewModel, _) {
          return FocusDetector(
            onFocusGained: () {
              animationController.forward();
            },
            child: Scaffold(
              backgroundColor: context.theme.appColors.background,
              body: Container(
                padding: const EdgeInsets.only(top: 50),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Opacity(
                          opacity: animation.value,
                          child: Text(
                            'TEXT',
                            style: context.theme.appTextTheme.heading3Bold,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
