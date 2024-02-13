part of 'catalog_screen_bloc.dart';

class CatalogScreenState extends Equatable {
  const CatalogScreenState({this.productList = const [], this.error = ''});
  final List<Product> productList;
  final Object error;

  @override
  List<Object> get props => [productList, error];

  CatalogScreenState copyWith({
    List<Product>? productList,
    Object? error,
  }) {
    return CatalogScreenState(
      productList: productList ?? this.productList,
      error: error ?? this.error,
    );
  }
}
