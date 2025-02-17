import 'package:flutter/material.dart' show BuildContext, MediaQuery;

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
}
