import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/stories/launch/launch_screen.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/stories/launch/launch_screen_view_model.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../presentation_layer/general/base/undefined_screen.dart';
import '../utils/locator.dart';
import 'navigation_service.dart';

final class RootRouteType {
  RootRouteType._();

  static const String networkLogger = 'networkLogger';
  static const String launch = 'launch';
}

final class RootRoutes {
  final navigationService = locator<NavigationService>();
  final talker = locator<Talker>();

  Route<dynamic> generateRoute(
    RouteSettings settings,
    Object? arguments,
  ) {
    switch (settings.name) {
      case RootRouteType.networkLogger:
        return MaterialPageRoute<void>(
          builder: (context) {
            return _buildNetworkLoggerScreen();
          },
        );
      case RootRouteType.launch:
        return MaterialPageRoute<void>(
          builder: (context) {
            return _buildLaunchScreen();
          },
          settings: settings,
        );
      default:
        return MaterialPageRoute<void>(
          builder: (_) => UndefinedScreen(name: settings.name),
          settings: settings,
        );
    }
  }

  // TalkerScreen

  TalkerScreen _buildNetworkLoggerScreen() {
    return TalkerScreen(talker: talker);
  }

  //LaunchScreen

  LaunchScreen _buildLaunchScreen() {
    LaunchScreenViewModel viewModel = LaunchScreenViewModel();

    return LaunchScreen(viewModel: viewModel);
  }
}
