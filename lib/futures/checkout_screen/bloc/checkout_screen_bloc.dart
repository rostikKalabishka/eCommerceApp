import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/models/cart_item.dart';
import 'package:e_commerce_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

part 'checkout_screen_event.dart';
part 'checkout_screen_state.dart';

class CheckoutScreenBloc
    extends Bloc<CheckoutScreenEvent, CheckoutScreenState> {
  CheckoutScreenBloc() : super(const CheckoutScreenState()) {
    on<CheckoutScreenEvent>((event, emit) async {
      if (event is LoadCheckoutScreenInfoEvent) {
        await _loadCheckoutScreenInfo(event, emit);
      } else if (event is HandlePaymentEvent) {
        await _handlePayment(event, emit);
      }
    });
  }

  Future<void> _loadCheckoutScreenInfo(LoadCheckoutScreenInfoEvent event,
      Emitter<CheckoutScreenState> emit) async {
    try {
      emit(state.copyWith(totalPrice: cart.totalPrice));
    } catch (e) {
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _handlePayment(
      HandlePaymentEvent event, Emitter<CheckoutScreenState> emit) async {
    try {
      if (event.details.complete != true) {
        throw 'Please fill in your card details';
      }
      emit(state.copyWith(isLoading: true));
      try {
        await _processPayment(cartItems: cart.cartItem);
      } catch (e) {
        emit(state.copyWith(error: e));
      }
    } catch (e) {
      emit(state.copyWith(error: e));
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }
}

Future<void> _processPayment({required List<CartItem> cartItems}) async {
  final paymentMethod = await Stripe.instance.createPaymentMethod(
    params: const PaymentMethodParams.card(
      paymentMethodData: PaymentMethodData(),
    ),
  );
  final response = await paymentClient.processPayment(
      paymentMethodId: paymentMethod.id,
      items: cartItems.map((cartItem) => cartItem.toJson()).toList());

  log('$response');
}
