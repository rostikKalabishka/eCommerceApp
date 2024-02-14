part of 'cart_screen_bloc.dart';

sealed class CartScreenEvent extends Equatable {
  const CartScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadCartInfoEvent extends CartScreenEvent {}

class AddProductToCartEvent extends CartScreenEvent {
  final Product product;

  const AddProductToCartEvent({required this.product});
  @override
  List<Object> get props => super.props..addAll([product]);
}

class RemoveProductFromEvent extends CartScreenEvent {
  final Product product;

  const RemoveProductFromEvent({required this.product});
  @override
  List<Object> get props => super.props..addAll([product]);
}
