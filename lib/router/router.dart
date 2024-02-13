import 'package:e_commerce_app/domain/factories/screen_factory.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouterPath {
  static const String categoriesScreen = '/';
  //'/categories';
  static const String catalogScreen = '/catalog';
  static const String cartScreen = '/cart';

  static const String checkoutScreen = '/checkout';
}

final _screenFactory = ScreenFactory();

class AppRouter {
  final GoRouter router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: AppRouterPath.categoriesScreen,
      builder: (BuildContext context, GoRouterState state) {
        return _screenFactory.makeCategoryScreen();
      },
    ),
    GoRoute(
      path: AppRouterPath.catalogScreen,
      builder: (BuildContext context, GoRouterState state) {
        final args = state.extra as String;
        return _screenFactory.makeCatalogScreen(args);
      },
    ),
    GoRoute(
      path: AppRouterPath.cartScreen,
      builder: (BuildContext context, GoRouterState state) {
        return _screenFactory.makeCartScreen();
      },
    ),
    GoRoute(
      path: AppRouterPath.checkoutScreen,
      builder: (BuildContext context, GoRouterState state) {
        return _screenFactory.makeCheckoutScreen();
      },
    )
  ]);
}
