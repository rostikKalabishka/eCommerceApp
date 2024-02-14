import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/models/cart_item.dart';
import 'package:e_commerce_app/domain/models/product.dart';
import 'package:e_commerce_app/main.dart';

import 'package:equatable/equatable.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(const CartScreenState()) {
    on<CartScreenEvent>((event, emit) async {
      if (event is LoadCartInfoEvent) {
        await _loadCartInfo(event, emit);
      } else if (event is AddProductToCartEvent) {
        await _addProductToCart(event, emit);
      } else if (event is RemoveProductFromEvent) {
        await _removeProductFromCart(event, emit);
      }
    });
  }
  Future<void> _loadCartInfo(
      LoadCartInfoEvent event, Emitter<CartScreenState> emit) async {
    try {
      emit(state.copyWith(
          cartItem: cart.cartItem,
          totalQuantity: cart.totalQuantity,
          totalPrice: cart.totalPrice));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _addProductToCart(
      AddProductToCartEvent event, Emitter<CartScreenState> emit) async {
    try {
      cartRepository.addProductToCart(event.product, 1);
      emit(state.copyWith(
          cartItem: List<CartItem>.from(cart.cartItem),
          totalQuantity: cart.totalQuantity,
          totalPrice: cart.totalPrice));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _removeProductFromCart(
      RemoveProductFromEvent event, Emitter<CartScreenState> emit) async {
    try {
      // cartRepository.removeProductFromCart(event.product);
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }
}
