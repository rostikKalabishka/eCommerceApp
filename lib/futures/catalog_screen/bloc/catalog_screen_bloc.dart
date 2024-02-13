import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/domain/models/product.dart';
import 'package:e_commerce_app/main.dart';
import 'package:equatable/equatable.dart';

part 'catalog_screen_event.dart';
part 'catalog_screen_state.dart';

class CatalogScreenBloc extends Bloc<CatalogScreenEvent, CatalogScreenState> {
  StreamSubscription<List<Product>>? _productSubscription;

  CatalogScreenBloc() : super(const CatalogScreenState()) {
    on<CatalogScreenEvent>(
      (event, emit) async {
        if (event is LoadCatalogEvent) {
          await _loadCatalog(event, emit);
        } else if (event is CancelProductSubscriptionEvent) {
          await _cancelProductSubscription(event, emit);
        }
      },
    );
  }

  Future<void> _loadCatalog(
      LoadCatalogEvent event, Emitter<CatalogScreenState> emit) async {
    try {
      final Completer completer = Completer();
      List<Product> product = [];
      _productSubscription =
          productRepository.streamProducts(event.catalogId).listen((products) {
        product = List.from(products);
        completer.complete();
      });
      await completer.future;
      log('${product.isEmpty}');
      emit(state.copyWith(productList: product));
    } catch (e) {
      log('$e');
      emit(state.copyWith(error: e));
    }
  }

  Future<void> _cancelProductSubscription(CancelProductSubscriptionEvent event,
      Emitter<CatalogScreenState> emit) async {
    await _productSubscription?.cancel();
  }
}
