part of 'catalog_screen_bloc.dart';

sealed class CatalogScreenState extends Equatable {
  const CatalogScreenState();
  
  @override
  List<Object> get props => [];
}

final class CatalogScreenInitial extends CatalogScreenState {}
