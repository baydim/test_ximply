import 'package:flutter/material.dart';

extension AppTheme on BuildContext {
  TextTheme get txtStyl {
    return Theme.of(this).textTheme;
  }

  ColorScheme get clrStyl => Theme.of(this).colorScheme;
}
