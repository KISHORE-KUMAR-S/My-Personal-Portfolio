import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show CustomTransitionPage;
import '../utils/enums/enums.dart';

class RouteSlideTransition extends CustomTransitionPage {
  final SlidePosition position;

  RouteSlideTransition({
    this.position = SlidePosition.top,
    required Widget child,
    super.key,
  }) : super(
          child: child,
          transitionDuration: position == SlidePosition.top
              ? Duration(milliseconds: 500)
              : Duration(milliseconds: 200),
          reverseTransitionDuration: position == SlidePosition.top
              ? Duration(milliseconds: 500)
              : Duration(milliseconds: 200),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            Offset offset = Offset.zero;

            switch (position) {
              case SlidePosition.top:
                offset = const Offset(0, -1);
                break;
              case SlidePosition.bottom:
                offset = const Offset(0, 1);
                break;
              case SlidePosition.left:
                offset = const Offset(-1, 0);
                break;
              case SlidePosition.right:
                offset = const Offset(1, 0);
                break;
            }

            return SlideTransition(
              position: Tween<Offset>(
                begin: offset,
                end: Offset.zero,
              ).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: child,
            );
          },
        );
}
