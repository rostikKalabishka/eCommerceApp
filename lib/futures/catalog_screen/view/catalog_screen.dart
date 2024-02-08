import 'package:e_commerce_app/futures/catalog_screen/bloc/catalog_screen_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatalogScreenBloc, CatalogScreenState>(
      builder: (context, state) {
        return const Scaffold();
      },
    );
  }
}
