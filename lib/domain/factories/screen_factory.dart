import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/futures/category_screen/bloc/category_screen_bloc.dart';
import 'package:e_commerce_app/futures/category_screen/view/category_screen.dart';
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
}
