import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/models/category.dart';
import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:equatable/equatable.dart';

part 'category_screen_event.dart';
part 'category_screen_state.dart';

class CategoryScreenBloc
    extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  final CategoryRepository categoryRepository;
  CategoryScreenBloc(this.categoryRepository)
      : super(const CategoryScreenState()) {
    on<CategoryScreenEvent>((event, emit) async {
      if (event is CategoryScreenInfoLoad) {
        await _loadCategory(event, emit);
      }
    });
  }

  Future<void> _loadCategory(
      CategoryScreenInfoLoad event, Emitter<CategoryScreenState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final random = Random();
      final categories = await categoryRepository.fetchCategories();
      final extents = List<int>.generate(
          categories.length, (index) => random.nextInt(3) + 2);
      emit(state.copyWith(
          isLoading: false, extents: extents, categories: categories));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }
}
