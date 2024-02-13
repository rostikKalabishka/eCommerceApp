import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String? description;
  final double price;
  final String imageUrl;
  final String category;
  final int stock;

  const Product(
      {required this.id,
      required this.name,
      this.description,
      required this.price,
      required this.imageUrl,
      required this.category,
      required this.stock});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        imageUrl,
        category,
        stock,
      ];

  factory Product.fromJson(Map<String, dynamic> json, {String? id}) {
    return Product(
        id: id ?? json['id'] as String? ?? '',
        name: json['name'] as String? ?? '',
        description: json['description'] as String? ?? '',
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        imageUrl: json['imageUrl'] as String? ??
            'https://source.unsplash.com/random/?fashion',
        category: json['category'] as String? ?? '',
        stock: json['stock'] as int? ?? 0);
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
    int? stock,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      stock: stock ?? this.stock,
    );
  }
}
