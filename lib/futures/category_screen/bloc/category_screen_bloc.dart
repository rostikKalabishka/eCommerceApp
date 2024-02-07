import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'category_screen_event.dart';
part 'category_screen_state.dart';

class CategoryScreenBloc extends Bloc<CategoryScreenEvent, CategoryScreenState> {
  CategoryScreenBloc() : super(CategoryScreenInitial()) {
    on<CategoryScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
