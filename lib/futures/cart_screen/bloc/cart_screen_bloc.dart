import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_screen_event.dart';
part 'cart_screen_state.dart';

class CartScreenBloc extends Bloc<CartScreenEvent, CartScreenState> {
  CartScreenBloc() : super(CartScreenInitial()) {
    on<CartScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
