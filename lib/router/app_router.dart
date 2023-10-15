import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:starter_kit/pages/WIP_pages/animate_page/animate_page.dart';
import 'package:starter_kit/pages/WIP_pages/board_shop_page/board_shop_page.dart';
import 'package:starter_kit/pages/WIP_pages/filter_riverpod/filter_riverpod.dart';
import 'package:starter_kit/pages/WIP_pages/firebase_crud/firebase_crud.dart';
import 'package:starter_kit/pages/WIP_pages/pull_to_refresh/infinite_scroll.dart';
import 'package:starter_kit/pages/WIP_pages/sliver_detail_page/sliver_detail_page.dart';
import 'package:starter_kit/pages/WIP_pages/sliver_page/sliver_page.dart';
import 'package:starter_kit/pages/WIP_pages/tab_container/tab_container.dart';
import 'package:starter_kit/pages/authentication/data/firebase_auth_repository.dart';
import 'package:starter_kit/pages/authentication/presentation/custom_sign_in_screen.dart';
import 'package:starter_kit/pages/pokemon/pokemon_riverpod_page.dart';
import 'package:starter_kit/pages/sandbox/sandbox_page.dart';
import 'package:starter_kit/router/go_router_refresh_stream.dart';

import '../pages/home_page/home_page.dart';

part 'app_router.g.dart';

enum Routes {
  home,
  sandbox,
  pokemon,
  refresh,
  sliver,
  sliverDetail,
  animate,
  boardShopPage,
  firebaseAuth,
  firebaseAuthProfile,
  tabContainer,
  filterRiverpod,
  firebaseCrud,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);

  return GoRouter(
    initialLocation: '/firebaseCrud',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: false,
    redirect: (context, state) {
      final isLoggedIn = authRepository.currentUser != null;

      if (isLoggedIn) {
        return '/firebaseAuthProfile';
      } else {
        return '/firebaseCrud';
      }
    },
    refreshListenable: GoRouterRefreshStream(authRepository.authStateChanges()),
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
        path: '/sliverDetail',
        name: Routes.sliverDetail.name,
        builder: (context, state) => SliverDetailPage(
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
        path: '/boardShopPage',
        name: Routes.boardShopPage.name,
        builder: (context, state) => BoardShopPage(
          key: state.pageKey,
        ),
      ),

      GoRoute(
        path: '/firebaseAuth',
        name: Routes.firebaseAuth.name,
        builder: (context, state) => CustomSignInScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/firebaseAuthProfile',
        name: Routes.firebaseAuthProfile.name,
        builder: (context, state) => ProfileScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/tabContainer',
        name: Routes.tabContainer.name,
        builder: (context, state) => TabContainerWidget(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/filterRiverpod',
        name: Routes.filterRiverpod.name,
        builder: (context, state) => FilterRiverpod(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/firebaseCrud',
        name: Routes.firebaseCrud.name,
        builder: (context, state) => FirebaseCrud(
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
