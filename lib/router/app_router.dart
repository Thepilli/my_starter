import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/pages/movie_page/movie_page.dart';

import '../pages/home_page/home_page.dart';

part 'app_router.g.dart';

enum Routes { home, movie }

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: Routes.home.name,
        builder: (context, state) => HomePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/movie',
        name: Routes.movie.name,
        builder: (context, state) => MoviePage(
          key: state.pageKey,
        ),
      ),
    ],
  );
}
