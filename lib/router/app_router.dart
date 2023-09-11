import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../pages/home_page/home_page.dart';

part 'app_router.g.dart';

enum Routes {
  home,

  detail,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/home',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    routes: [
      GoRoute(
        path: '/home',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      // GoRoute(
      //   path: '/detail',
      //   name: Routes.detail.name,
      //   pageBuilder: (context, state) {
      //     final book = state.extra as Book;
      //     return MaterialPage(
      //       key: state.pageKey,
      //       child: DetailPage(book: book),
      //     );
      //   },
      // ),
    ],
  );
}
