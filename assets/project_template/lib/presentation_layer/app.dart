import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/services/navigator_observer.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/business_layer/utils/flavor_config.dart';

import '../business_layer/services/root_routes.dart';
import '../localizations/app_localizations.dart';

final class App extends StatelessWidget {
  App({
    required this.initialRoute,
    required this.navigatorKey,
    required this.mainNavigatorObserver,
    super.key,
  });

  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;
  final RootRoutes rootRoutes = RootRoutes();
  final MainNavigatorObserver mainNavigatorObserver;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      navigatorObservers: [mainNavigatorObserver],
      onGenerateRoute: (RouteSettings settings) => rootRoutes.generateRoute(
        settings,
        null,
      ),
      builder: (context, child) {
        if (!FlavorConfig.isProduction()) {
          return Stack(
            children: [
              child!,
              const Positioned(
                top: 0,
                left: 0,
                child: Banner(
                  message: 'DEV',
                  color: Colors.red,
                  location: BannerLocation.topStart,
                ),
              ),
            ],
          );
        }
        return child!;
      },
      navigatorKey: navigatorKey,
      initialRoute: initialRoute,
    );
  }
}
