import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/extensions/theme_extension.dart';

mixin AlertableMixin {
  Future<void> showActionSheet({
    required BuildContext context,
    required String title,
    required String body,
    required String firstButtonTitle,
    required String secondButtonTitle,
    required VoidCallback? onFirstButtonPress,
    required VoidCallback? onSecondButtonPress,
    Color? firstButtonColor,
    Color? secondButtonColor,
  }) async {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      width: MediaQuery.of(context).size.width,
      dialogBorderRadius: BorderRadius.circular(12),
      isDense: true,
      dialogBackgroundColor: context.theme.appColors.n0,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: context.theme.appTextTheme.subHeading2SemiBold,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            body,
            style: context.theme.appTextTheme.body1Regular,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [],
          ),
        ],
      ),
    ).show();
  }

  Future<void> showContextSheet({
    required BuildContext context,
    required String firstItemTitle,
    required String secondItemTitle,
    required Widget firstItemIcon,
    required Widget secondItemIcon,
    required VoidCallback? onFirstButtonPress,
    required VoidCallback? onSecondButtonPress,
    Color? firstButtonColor,
    Color? secondButtonColor,
  }) async {
    AwesomeDialog(
      context: context,
      animType: AnimType.scale,
      dialogType: DialogType.noHeader,
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 12),
      dialogBorderRadius: BorderRadius.circular(12),
      isDense: true,
      width: MediaQuery.of(context).size.width * 0.45,
      dialogBackgroundColor: context.theme.appColors.transparent,
      alignment: Alignment.topRight,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            overlayColor:
                const WidgetStatePropertyAll<Color>(Colors.transparent),
            onTap: () {
              onFirstButtonPress?.call();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  firstItemIcon,
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    firstItemTitle,
                    style: context.theme.appTextTheme.body1Medium.copyWith(
                      color: firstButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          InkWell(
            overlayColor:
                const WidgetStatePropertyAll<Color>(Colors.transparent),
            onTap: () {
              onSecondButtonPress?.call();
            },
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  secondItemIcon,
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    secondItemTitle,
                    style: context.theme.appTextTheme.body1Medium.copyWith(
                      color: secondButtonColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 2),
        ],
      ),
    ).show();
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      content: Center(
        child: SizedBox(
          height: 56,
          width: 56,
          child: CircularProgressIndicator(
            color: context.theme.appColors.sc500,
          ),
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
