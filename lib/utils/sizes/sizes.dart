import 'package:flutter/material.dart';
import '../extensions/context_extensions.dart';

class Sizes {
  double spacer(BuildContext context) => context.isMobile ? 300 : 400;

  double heroTitleFontSize(BuildContext context) {
    if (context.isTablet) return 100;
    if (context.isMobile) return 80;
    return 127;
  }
}
