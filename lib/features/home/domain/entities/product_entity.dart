import 'package:equatable/equatable.dart';

class Products extends Equatable {
  final String? title;
  final String? description;
  final String? image;
  final double? price;
  final String? productType;

  const Products({
    this.productType,
    this.title,
    this.description,
    this.image,
    this.price,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        image,
        price,
        productType,
      ];
}
