import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/localizations/app_localizations.dart';

extension BuildContextHelper on BuildContext {
  AppLocalizations get locale {
    // if no locale was found, returns a default
    return AppLocalizations.of(this);
  }
}
