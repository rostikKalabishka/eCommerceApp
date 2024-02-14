import 'package:e_commerce_app/futures/cart_screen/bloc/cart_screen_bloc.dart';
import 'package:e_commerce_app/router/router.dart';
import 'package:e_commerce_app/widget/cart_item_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    context.read<CartScreenBloc>().add(LoadCartInfoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartScreenBloc, CartScreenState>(
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Card'),
            centerTitle: false,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Text('${state.totalQuantity} Item in the cart'),
                const SizedBox(
                  height: 16,
                ),
                state.cartItem.isEmpty
                    ? const Text('No item in the cart')
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.cartItem.length,
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          final cartItem = state.cartItem[i];
                          return CartItemCard(
                            cartItem: cartItem,
                            addProductToCart: () {
                              context.read<CartScreenBloc>().add(
                                  AddProductToCartEvent(
                                      product: cartItem.product));
                            },
                            removeProductFromCart: () {
                              context.read<CartScreenBloc>().add(
                                  RemoveProductFromEvent(
                                      product: cartItem.product));
                            },
                          );
                        })
              ]),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: [
                Expanded(child: Text('Total: \$${state.totalPrice}')),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: FilledButton(
                        onPressed: () {
                          context.pushNamed(AppRouterPathName.checkoutScreen);
                        },
                        child: const Text('Pay Now')))
              ],
            ),
          ),
        );
      },
    );
  }
}
