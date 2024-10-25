import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../base/snack_notification.dart';

mixin SnackBarMixin {
  void showSuccessMessage(BuildContext context, String message) {
    showSnackBar(context, message, SnackNotificationType.success);
  }

  void showErrorMessage(BuildContext context, String message) {
    showSnackBar(context, message, SnackNotificationType.error);
  }

  void showWarningMessage(BuildContext context, String message) {
    showSnackBar(context, message, SnackNotificationType.warning);
  }

  void showSnackBar(
    BuildContext context,
    String message,
    SnackNotificationType type,
  ) {
    AnimationController? localAnimationController;
    showTopSnackBar(
      Overlay.of(context),
      SnackNotification(
        message: message,
        type: type,
        onClose: () {
          localAnimationController?.reverse();
        },
      ),
      displayDuration: const Duration(seconds: 2),
      animationDuration: const Duration(seconds: 1),
      reverseAnimationDuration: const Duration(milliseconds: 500),
      dismissType: DismissType.onSwipe,
      onAnimationControllerInit: (controller) {
        localAnimationController = controller;
      },
    );
  }
}
