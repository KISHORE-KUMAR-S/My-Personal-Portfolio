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
