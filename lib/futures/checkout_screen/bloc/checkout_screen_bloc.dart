import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'checkout_screen_event.dart';
part 'checkout_screen_state.dart';

class CheckoutScreenBloc extends Bloc<CheckoutScreenEvent, CheckoutScreenState> {
  CheckoutScreenBloc() : super(CheckoutScreenInitial()) {
    on<CheckoutScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
