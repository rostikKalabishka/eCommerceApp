part of 'checkout_screen_bloc.dart';

sealed class CheckoutScreenState extends Equatable {
  const CheckoutScreenState();
  
  @override
  List<Object> get props => [];
}

final class CheckoutScreenInitial extends CheckoutScreenState {}
