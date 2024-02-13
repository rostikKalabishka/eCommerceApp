import 'package:e_commerce_app/domain/models/cart_item.dart';
import 'package:e_commerce_app/domain/models/product.dart';
import 'package:e_commerce_app/main.dart';
import 'package:uuid/uuid.dart';

class CartRepository {
  const CartRepository();

  void addProductToCart(Product product, int quantity) {
    var existingCartItem = cart.cartItem
        .where((item) => item.product.id == product.id)
        .firstOrNull;

    if (existingCartItem != null) {
      final initialQuantity = existingCartItem.quantity;
      cart = cart.copyWith(
        cartItem: List.from(cart.cartItem)
          ..remove(existingCartItem)
          ..add(
            existingCartItem.copyWith(
              quantity: initialQuantity + quantity,
            ),
          ),
      );
    } else {
      cart = cart.copyWith(
        cartItem: List.from(cart.cartItem)
          ..add(CartItem(
              id: const Uuid().v4(), product: product, quantity: quantity)),
      );
    }
  }

  removeProductFromCart() {}

  clearCart() {}
}
