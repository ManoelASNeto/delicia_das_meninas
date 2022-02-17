import 'package:dartz/dartz.dart';
import 'package:loja_delicia_das_meninas/features/home/domain/entities/product_entity.dart';

import '../../../../core/erros/failures.dart';
import '../repositories/i_product_repository.dart';

class GetProduct {
  final IProductRepository repository;

  GetProduct(this.repository);

  Future<Either<Failures, List<Products>>> call(event) async {
    return await repository.productList();
  }
}
