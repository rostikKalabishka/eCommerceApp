import 'package:e_commerce_app/domain/models/category.dart';
import 'package:e_commerce_app/futures/category_screen/bloc/category_screen_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    context.read<CategoryScreenBloc>().add(CategoryScreenInfoLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryScreenBloc, CategoryScreenState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            title: const Text('Categories'),
          ),
          body: MasonryGridView.count(
              padding: const EdgeInsets.only(top: 120, left: 4, right: 4),
              itemCount: Category.categories.length,
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                final height = state.extents[index] * 100;
                final category = state.categories[index];
                return InkWell(
                  onTap: () {},
                  child: Hero(
                    tag: category.id,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: NetworkImage(
                                category.imageUrl,
                              ),
                              fit: BoxFit.cover)),
                      height: height.toDouble(),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
