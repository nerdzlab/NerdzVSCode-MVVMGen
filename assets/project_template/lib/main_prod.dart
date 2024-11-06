import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/utils/flavor_config.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/app.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/stories/root/root_coordinator.dart';

import 'business_layer/services/root_routes.dart';
import 'business_layer/utils/locator.dart';

Future<void> main() async {
  FlavorConfig().env = Flavor.prod;

  await GetStorage.init();
  await setupLocator();
  final rootCoordinator = RootCoordinator();
  await rootCoordinator.start();

  runApp(
    App(
      initialRoute: RootRouteType.launch,
      navigatorKey: rootCoordinator.navigatorKey,
    ),
  );
}
