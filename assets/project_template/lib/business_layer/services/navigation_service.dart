import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/services/navigator_observer.dart';

final class NavigationService {
  NavigationService();

  GlobalKey<NavigatorState> rootNavKey = GlobalKey();

  final mainNavigatorObserver = MainNavigatorObserver();

  NavigatorState get rootNavigatorState => rootNavKey.currentState!;

  bool isRouteExist(String routeName) {
    return mainNavigatorObserver.routeStack.any(
      (route) => route.settings.name == routeName,
    );
  }
}
