import 'package:db_client/db_client.dart';
import 'package:e_commerce_app/domain/config/firebase_options.dart';
import 'package:e_commerce_app/domain/factories/screen_factory.dart';
import 'package:e_commerce_app/domain/models/cart.dart';
import 'package:e_commerce_app/domain/repositories/cart_repository/cart_repository.dart';
import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/domain/repositories/product_repository/product_repository.dart';
import 'package:e_commerce_app/router/router.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final dbClient = DbClient();
final categoryRepository = CategoryRepository(dbClient: dbClient);
final productRepository = ProductRepository(dbClient: dbClient);
final screenFactory = ScreenFactory();
const cartRepository = CartRepository();
const userId = 'user_1234';
var cart = const Cart(userId: userId, cartItem: []);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // productRepository.createProducts();
  // categoryRepository.createCategories();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: appRouter.router,
    );
  }
}
