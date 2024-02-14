part of 'cart_screen_bloc.dart';

class CartScreenState extends Equatable {
  const CartScreenState(
      {this.totalQuantity = 0,
      this.cartItem = const [],
      this.error = '',
      this.totalPrice = 0.0});
  final int totalQuantity;
  final List<CartItem> cartItem;
  final Object error;
  final double totalPrice;

  @override
  List<Object> get props => [totalQuantity, cartItem, error, totalPrice];

  CartScreenState copyWith({
    int? totalQuantity,
    List<CartItem>? cartItem,
    Object? error,
    double? totalPrice,
  }) {
    return CartScreenState(
      error: error ?? this.error,
      totalQuantity: totalQuantity ?? this.totalQuantity,
      cartItem: cartItem ?? this.cartItem,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
