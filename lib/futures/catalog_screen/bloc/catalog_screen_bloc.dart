import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'catalog_screen_event.dart';
part 'catalog_screen_state.dart';

class CatalogScreenBloc extends Bloc<CatalogScreenEvent, CatalogScreenState> {
  CatalogScreenBloc() : super(CatalogScreenInitial()) {
    on<CatalogScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
