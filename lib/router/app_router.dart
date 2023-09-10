import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page/home_page.dart';

part 'app_router.g.dart';

enum Routes {
  home,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
