import 'package:flutter/material.dart';

final class NavigationService {
  NavigationService();

  GlobalKey<NavigatorState> rootNavKey = GlobalKey();

  NavigatorState get rootNavigatorState => rootNavKey.currentState!;
}
