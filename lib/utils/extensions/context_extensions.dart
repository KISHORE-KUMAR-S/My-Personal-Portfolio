import 'package:delightful_toast/delight_toast.dart' show DelightToastBar;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/app_state_provider.dart';

extension ContextExtensions on BuildContext {
  bool get isTablet {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.size.width <= 1025 && mediaQuery.size.width >= 770;
  }

  bool get isMobile {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.size.width <= 770;
  }

  bool get isDesktop {
    final mediaQuery = MediaQuery.of(this);
    return mediaQuery.size.width > 1025;
  }

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
