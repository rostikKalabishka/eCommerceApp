part of 'catalog_screen_bloc.dart';

sealed class CatalogScreenEvent extends Equatable {
  const CatalogScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadCatalogEvent extends CatalogScreenEvent {
  final String catalogId;

  const LoadCatalogEvent({required this.catalogId});
  @override
  List<Object> get props => super.props..addAll([catalogId]);
}

class CancelProductSubscriptionEvent extends CatalogScreenEvent {}

class AddProductToCartEvent extends CatalogScreenEvent {
  final Product product;

  const AddProductToCartEvent({required this.product});

  @override
  List<Object> get props => super.props..addAll([product]);
}
