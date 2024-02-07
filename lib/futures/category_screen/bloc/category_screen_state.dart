part of 'category_screen_bloc.dart';

sealed class CategoryScreenState extends Equatable {
  const CategoryScreenState();
  
  @override
  List<Object> get props => [];
}

final class CategoryScreenInitial extends CategoryScreenState {}
