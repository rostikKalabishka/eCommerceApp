import 'package:e_commerce_app/futures/catalog_screen/bloc/catalog_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../router/router.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key, required this.category});
  final String category;

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    context
        .read<CatalogScreenBloc>()
        .add(LoadCatalogEvent(catalogId: widget.category));
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   context.dependOnInheritedWidgetOfExactType();
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   context.read<CatalogScreenBloc>().add(CancelProductSubscriptionEvent());
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogScreenBloc, CatalogScreenState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Catalog'),
            actions: [
              IconButton(
                onPressed: () {
                  context.pushNamed(AppRouterPathName.cartScreen);
                },
                icon: Badge(
                  isLabelVisible: state.cartItemList.isNotEmpty,
                  child: const Icon(Icons.shopping_cart),
                ),
              )
            ],
          ),
          body: Center(
              child: state.productList.isNotEmpty
                  ? ListView.builder(
                      itemCount: state.productList.length,
                      itemBuilder: (context, index) {
                        final product = state.productList[index];
                        return ListTile(
                          onTap: () {
                            context
                                .read<CatalogScreenBloc>()
                                .add(AddProductToCartEvent(product: product));
                          },
                          leading: Image.network(
                            product.imageUrl,
                            fit: BoxFit.cover,
                            width: 100,
                          ),
                          title: Text(product.name),
                          subtitle: Text(product.category),
                          trailing: Text('\$${product.price}'),
                        );
                      })
                  : const CircularProgressIndicator.adaptive()),
        );
      },
    );
  }
}
