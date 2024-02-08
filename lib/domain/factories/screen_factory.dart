import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/futures/catalog_screen/bloc/catalog_screen_bloc.dart';
import 'package:e_commerce_app/futures/catalog_screen/catalog_screen.dart';
import 'package:e_commerce_app/futures/category_screen/bloc/category_screen_bloc.dart';
import 'package:e_commerce_app/futures/category_screen/category_screen.dart';

import 'package:e_commerce_app/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenFactory {
  final CategoryRepository categoryRepository =
      CategoryRepository(dbClient: dbClient);
  makeCategoryScreen() {
    return BlocProvider(
      create: (_) => CategoryScreenBloc(categoryRepository),
      child: const CategoriesScreen(),
    );
  }

  makeCatalogScreen() {
    return BlocProvider(
      create: (_) => CatalogScreenBloc(),
      child: const CatalogScreen(),
    );
  }
}
