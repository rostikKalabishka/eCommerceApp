// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:e_commerce_app/domain/models/cart_item.dart';

class Cart extends Equatable {
  final String userId;
  final List<CartItem> cartItem;

  const Cart({
    required this.userId,
    required this.cartItem,
  });

  @override
  List<Object?> get props => [userId, cartItem];

  Cart copyWith({
    String? userId,
    List<CartItem>? cartItem,
  }) {
    return Cart(
      userId: userId ?? this.userId,
      cartItem: cartItem ?? this.cartItem,
    );
  }

  int get totalQuantity =>
      cartItem.fold(0, (total, item) => total + item.quantity);
  double get totalPrice =>
      cartItem.fold(0, (total, item) => total + item.subtotal);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'cartItem': cartItem.map((item) => item.toJson()).toList()
    };
  }
}
