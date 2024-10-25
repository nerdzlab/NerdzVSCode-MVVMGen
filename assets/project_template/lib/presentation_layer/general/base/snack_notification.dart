import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/extensions/theme_extension.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../abstract/base_widget.dart';
import 'base_imports.dart';

enum SnackNotificationType {
  success,
  error,
  warning,
}

final class SnackNotification extends BaseStatefulWidget {
  final String message;
  final SnackNotificationType type;
  final VoidCallback onClose;

  const SnackNotification({
    super.key,
    required this.message,
    required this.type,
    required this.onClose,
  });

  @override
  State createState() => _SnackNotificationState();
}

class _SnackNotificationState extends State<SnackNotification> {
  static const _kDefaultBoxShadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0, 8),
      spreadRadius: 1,
      blurRadius: 30,
    ),
  ];

  late Image _icon;
  late Color _backgroundColor;
  late Color _textColor;

  @override
  void initState() {
    super.initState();

    switch (widget.type) {
      case SnackNotificationType.success:
        _icon = Assets.images.googleLogo.image();
        _backgroundColor = ColorName.background;
        _textColor = ColorName.n1000;
        break;
      case SnackNotificationType.error:
        _icon = Assets.images.googleLogo.image();
        _backgroundColor = ColorName.background;
        _textColor = ColorName.e500;
        break;
      case SnackNotificationType.warning:
        _icon = Assets.images.googleLogo.image();
        _backgroundColor = ColorName.background;
        _textColor = ColorName.w500;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        constraints: const BoxConstraints(minHeight: 52),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: _kDefaultBoxShadow,
        ),
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: _backgroundColor,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 22,
                height: 22,
                child: _icon,
              ),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  widget.message,
                  maxLines: 3,
                  style: context.theme.appTextTheme.body1Medium.copyWith(
                    color: _textColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
