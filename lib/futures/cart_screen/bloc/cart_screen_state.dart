part of 'cart_screen_bloc.dart';

sealed class CartScreenState extends Equatable {
  const CartScreenState();
  
  @override
  List<Object> get props => [];
}

final class CartScreenInitial extends CartScreenState {}
