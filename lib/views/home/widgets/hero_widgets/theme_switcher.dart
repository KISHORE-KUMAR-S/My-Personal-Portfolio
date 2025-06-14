import 'package:flutter/material.dart';

import '../../../../utils/extensions/context_extensions.dart';
import 'theme_switcher_mobile.dart';
import 'theme_switcher_web.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? ThemeSwitcherMobile() : ThemeSwitcherWeb();
  }
}

Transform buildSpacer(BuildContext context) {
  return Transform.scale(
    scale: 2,
    child: Container(
      height: context.isMobile ? 40 : 30,
      width: 2,
      color: Colors.white.withValues(alpha: 0.1),
    ),
  );
}
