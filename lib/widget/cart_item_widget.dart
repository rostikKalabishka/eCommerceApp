import 'package:e_commerce_app/domain/models/cart_item.dart';
import 'package:flutter/material.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(
      {super.key,
      required this.cartItem,
      this.addProductToCart,
      this.removeProductFromCart});
  final CartItem cartItem;
  final VoidCallback? addProductToCart;
  final VoidCallback? removeProductFromCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                cartItem.product.imageUrl,
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.product.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${(cartItem.subtotal).toStringAsFixed(2)}'),
                    Row(
                      children: [
                        IconButton(
                          visualDensity: VisualDensity.compact,
                          onPressed: addProductToCart,
                          icon: const Icon(Icons.add),
                        ),
                        Text('${cartItem.quantity}'),
                        IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: removeProductFromCart,
                            icon: const Icon(Icons.remove))
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
