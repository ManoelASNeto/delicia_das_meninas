import 'package:dartz/dartz.dart';

import '../../../../core/erros/exception.dart';
import '../../../../core/erros/failures.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepository implements IProductRepository {
  final IProductRemoteDataSource remoteDataSource;

  ProductRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Products>>> productList() async {
    try {
      var productListModel = await remoteDataSource.productList();

      final entity = productListModel.map((e) => e.toEntity()).toList();

      return Right(entity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
