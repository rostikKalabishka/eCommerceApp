import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/futures/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:e_commerce_app/futures/cart_screen/cart_screen.dart';
import 'package:e_commerce_app/futures/catalog_screen/bloc/catalog_screen_bloc.dart';
import 'package:e_commerce_app/futures/catalog_screen/catalog_screen.dart';
import 'package:e_commerce_app/futures/category_screen/bloc/category_screen_bloc.dart';
import 'package:e_commerce_app/futures/category_screen/category_screen.dart';
import 'package:e_commerce_app/futures/checkout_screen/bloc/checkout_screen_bloc.dart';
import 'package:e_commerce_app/futures/checkout_screen/checkout_screen.dart';

import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFactory {
  // final String categoryId;
  final CategoryRepository categoryRepository =
      CategoryRepository(dbClient: dbClient);

  // ScreenFactory({required this.categoryId});
  Widget makeCategoryScreen() {
    return BlocProvider(
      create: (_) => CategoryScreenBloc(categoryRepository),
      child: const CategoriesScreen(),
    );
  }

  makeCatalogScreen(String category) {
    return BlocProvider(
      create: (_) => CatalogScreenBloc(),
      child: CatalogScreen(
        category: category,
      ),
    );
  }

  makeCartScreen() {
    return BlocProvider(
      create: (_) => CartScreenBloc(),
      child: const CartScreen(),
    );
  }

  makeCheckoutScreen() {
    return BlocProvider(
      create: (_) => CheckoutScreenBloc(),
      child: const CheckoutScreen(),
    );
  }
}
