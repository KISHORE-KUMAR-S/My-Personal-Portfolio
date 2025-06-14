import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRoute, GoRouter, GoRouterState;
import 'package:personal_portfolio/views/localsend/views/localsend_screen.dart';

import '../utils/enums/enums.dart' show SlidePosition;
import '../views/home/home_screen.dart';
import 'route_slide_transition.dart' show RouteSlideTransition;
import 'routes.dart' show Routes;

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        state: state,
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: Routes.localsend,
      pageBuilder: (context, state) => _buildPageWithDefaultTransition(
        state: state,
        child: LocalsendScreen(),
      ),
    )
  ],
);

_buildPageWithDefaultTransition({
  required GoRouterState state,
  required Widget child,
}) {
  return RouteSlideTransition(
    position: SlidePosition.left,
    child: child,
  );
}
