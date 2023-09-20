import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/pages/animate_page/animate_page.dart';
import 'package:starter_kit/pages/pokemon/pokemon_riverpod_page.dart';
import 'package:starter_kit/pages/pull_to_refresh/infinite_scroll.dart';
import 'package:starter_kit/pages/sandbox/sandbox_page.dart';
import 'package:starter_kit/pages/sliver_page/sliver_page.dart';
import 'package:starter_kit/pages/veritcal_page/calendar_page.dart';
import 'package:starter_kit/pages/veritcal_page/detail_page.dart';
import 'package:starter_kit/pages/veritcal_page/veritcal_page.dart';

import '../pages/home_page/home_page.dart';

part 'app_router.g.dart';

enum Routes { home, sandbox, pokemon, refresh, sliver, animate, vertical, detail, calendar }

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/vertical',
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
      GoRoute(
        path: '/refresh',
        name: Routes.refresh.name,
        builder: (context, state) => InfiniteScroll(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/pokemon',
        name: Routes.pokemon.name,
        builder: (context, state) => PokemonRiverpodPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/sandbox',
        name: Routes.sandbox.name,
        builder: (context, state) => SandboxPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/sliver',
        name: Routes.sliver.name,
        builder: (context, state) => SliverPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/animate',
        name: Routes.animate.name,
        builder: (context, state) => AnimatePage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/vertical',
        name: Routes.vertical.name,
        builder: (context, state) => VerticalPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/detail',
        name: Routes.detail.name,
        builder: (context, state) => DetailPage(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/calendar',
        name: Routes.calendar.name,
        builder: (context, state) => CalendarPage(
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
