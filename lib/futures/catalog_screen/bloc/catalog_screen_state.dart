part of 'catalog_screen_bloc.dart';

class CatalogScreenState extends Equatable {
  const CatalogScreenState(
      {this.productList = const [],
      this.error = '',
      this.cartItemList = const []});
  final List<Product> productList;
  final List<CartItem> cartItemList;
  final Object error;

  @override
  List<Object> get props => [productList, error, cartItemList];

  CatalogScreenState copyWith({
    List<Product>? productList,
    Object? error,
    List<CartItem>? cartItemList,
  }) {
    return CatalogScreenState(
      productList: productList ?? this.productList,
      error: error ?? this.error,
      cartItemList: cartItemList ?? this.cartItemList,
    );
  }
}
