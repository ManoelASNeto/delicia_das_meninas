import 'package:dartz/dartz.dart';
import 'package:loja_delicia_das_meninas/core/erros/failures.dart';
import 'package:loja_delicia_das_meninas/features/home/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<Either<Failure, List<Products>>> productList();
}
