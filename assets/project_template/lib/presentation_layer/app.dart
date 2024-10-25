import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../business_layer/services/root_routes.dart';
import '../localizations/app_localizations.dart';

final class App extends StatelessWidget {
  App({
    required this.initialRoute,
    required this.navigatorKey,
    super.key,
  });

  final String initialRoute;
  final GlobalKey<NavigatorState> navigatorKey;
  final RootRoutes rootRoutes = RootRoutes();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: (RouteSettings settings) => rootRoutes.generateRoute(
        settings,
        null,
      ),
      builder: (context, child) {
        ///Need to determine inside app is this dev or no
        if (!kReleaseMode) {
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
