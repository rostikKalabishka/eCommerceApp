import 'dart:math';

import 'package:e_commerce_app/domain/models/category.dart';
import 'package:e_commerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Category> _categories = [];
  List<int> _extents = [];
  final random = Random();
  @override
  void initState() {
    _loadCategory();
    super.initState();
  }

  Future<void> _loadCategory() async {
    final categories = await categoryRepository.fetchCategories();
    final extents =
        List<int>.generate(categories.length, (index) => random.nextInt(3) + 2);

    setState(() {
      _categories = categories;
      _extents = extents;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            final height = _extents[index] * 100;
            return InkWell(
              onTap: () {},
              child: Hero(
                tag: _categories[index].id,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          image: NetworkImage(
                            _categories[index].imageUrl,
                          ),
                          fit: BoxFit.cover)),
                  height: height.toDouble(),
                ),
              ),
            );
          }),
    );
  }
}
