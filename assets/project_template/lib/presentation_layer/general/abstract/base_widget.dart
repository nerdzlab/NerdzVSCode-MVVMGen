import 'package:flutter/material.dart';
import 'package:VIEW_MODEL_PROJECT_IDENTIFIER_QW32/presentation_layer/general/abstract/snack_bar_mixin.dart';

import 'alertable_mixin.dart';

abstract class BaseStatefulWidget extends StatefulWidget
    with AlertableMixin, SnackBarMixin {
  const BaseStatefulWidget({super.key});
}

abstract class BaseStatelessWidget extends StatelessWidget
    with AlertableMixin, SnackBarMixin {
  const BaseStatelessWidget({super.key});
}
