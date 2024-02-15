part of 'checkout_screen_bloc.dart';

sealed class CheckoutScreenEvent extends Equatable {
  const CheckoutScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadCheckoutScreenInfoEvent extends CheckoutScreenEvent {}

class HandlePaymentEvent extends CheckoutScreenEvent {
  final CardFieldInputDetails details;

  const HandlePaymentEvent({required this.details});
  @override
  List<Object> get props => super.props..add(details);
}

class ProcessPayment extends CheckoutScreenEvent {}
