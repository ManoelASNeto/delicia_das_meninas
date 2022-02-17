import 'package:equatable/equatable.dart';
import 'package:loja_delicia_das_meninas/features/home/domain/entities/product_entity.dart';

class ProductsModel extends Equatable {
  final String? title;
  final String? description;
  final String? productType;
  final String? image;
  final double? price;

  const ProductsModel({
    this.title,
    this.description,
    this.productType,
    this.image,
    this.price,
  });

  @override
  List<Object?> get props {
    return [
      title,
      description,
      productType,
      image,
      price,
    ];
  }

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        title: json['title'],
        description: json['description'],
        productType: json['productType'],
        image: json['image'],
        price: json['price'],
      );

  factory ProductsModel.fromEntity(Products entity) => ProductsModel(
        title: entity.title,
        description: entity.description,
        productType: entity.productType,
        image: entity.image,
        price: entity.price,
      );

  Products toEntity() => Products(
        title: title,
        description: description,
        productType: productType,
        image: image,
        price: price,
      );
}
