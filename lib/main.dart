import 'package:db_client/db_client.dart';
import 'package:e_commerce_app/domain/config/firebase_options.dart';
import 'package:e_commerce_app/domain/repositories/category_repository/category_repository.dart';
import 'package:e_commerce_app/futures/category_screen/view/category_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

final dbClient = DbClient();
final categoryRepository = CategoryRepository(dbClient: dbClient);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // categoryRepository.createCategories();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CategoriesScreen(),
    );
  }
}
