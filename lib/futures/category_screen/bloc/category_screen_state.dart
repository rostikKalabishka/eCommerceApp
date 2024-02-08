// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_screen_bloc.dart';

class CategoryScreenState extends Equatable {
  const CategoryScreenState(
      {this.categories = const [],
      this.isLoading = false,
      this.extents = const [],
      this.error = ''});
  final List<Category> categories;
  final bool isLoading;
  final List<int> extents;
  final Object error;

  @override
  List<Object> get props => [categories, isLoading, extents, error];

  CategoryScreenState copyWith({
    List<Category>? categories,
    bool? isLoading,
    List<int>? extents,
    Object? error,
  }) {
    return CategoryScreenState(
      categories: categories ?? this.categories,
      isLoading: isLoading ?? this.isLoading,
      extents: extents ?? this.extents,
      error: error ?? this.error,
    );
  }
}
