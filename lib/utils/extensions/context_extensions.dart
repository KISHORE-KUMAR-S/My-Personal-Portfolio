import 'package:delightful_toast/delight_toast.dart' show DelightToastBar;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart' show ReadContext;

import '../../providers/app_state_provider.dart';

extension ContextExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  double get screenHeight => MediaQuery.of(this).size.height;

  bool get isTablet => screenWidth <= 1025 && screenWidth >= 770;

  bool get isMobile => screenWidth <= 770;

  bool get isDesktop => screenWidth > 1025;

  getResponiveValue<T>(List<T> number) {
    assert(number.length == 3);

    if (isMobile) return number[0];
    if (isTablet) return number[1];

    return number[2];
  }

  double get spacer => isMobile ? 300 : 400;

  double assignHeight(
    double fraction, {
    double additions = 0,
    double subtraction = 0,
  }) {
    return (screenHeight - (subtraction) + (additions)) * fraction;
  }

  double assignWidth(
    double fraction, {
    double additions = 0,
    double subtraction = 0,
  }) {
    return (screenWidth - (subtraction) + (additions)) * fraction;
  }

  double get heroTitleFontSize {
    if (isTablet) return 100;
    if (isMobile) return 80;
    return 127;
  }

  double responsiveSize({
    required double xs,
    required double lg,
    double? sm,
    double? md,
    double? xl,
  }) {
    if (isMobile) return xs;
    if (isTablet) return sm ?? (md ?? xs);
    if (isDesktop) return md ?? lg;

    return xl ?? lg;
  }

  showToast(String message) {
    final isLightMode = read<AppStateProvider>().isLightMode;

    DelightToastBar(
      snackbarDuration: Duration(seconds: 2),
      autoDismiss: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: isLightMode ? Colors.white : Colors.black,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondary,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Text(
              message,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: isLightMode ? Colors.black : Colors.white,
              ),
            ),
          ),
        );
      },
    ).show(this);
  }
}
