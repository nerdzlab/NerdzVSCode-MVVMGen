import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/services/navigator_observer.dart';
import 'package:shake_detector/shake_detector.dart';

import '../../../business_layer/services/navigation_service.dart';
import '../../../business_layer/services/root_routes.dart';
import '../../../business_layer/utils/locator.dart';
import '../../../data_layer/repositories/auth_storage.dart';
import '../../general/abstract/coordinator_type.dart';

final class RootCoordinator extends CoordinatorType {
  final _navigationService = locator<NavigationService>();
  final _authStorage = locator<AuthStorage>();

  late StreamSubscription logOutStreamSubscription;

  late StreamSubscription<Map> branchIoStreamSubscription;

  GlobalKey<NavigatorState> get navigatorKey => _navigationService.rootNavKey;

  MainNavigatorObserver get mainNavigatorObserver =>
      _navigationService.mainNavigatorObserver;

  @override
  Future<void> start() async {
    _startShakeDetection();
    _listenForLogout();
  }

  _listenForLogout() {
    logOutStreamSubscription = _authStorage.listenForLogout(() async {});
  }

  _startShakeDetection() {
    if (kReleaseMode) {
      return;
    }

    ShakeDetector.autoStart(
      onShake: () {
        _navigationService.rootNavigatorState.pushNamed(
          RootRouteType.networkLogger,
        );
      },
    );
  }
}
