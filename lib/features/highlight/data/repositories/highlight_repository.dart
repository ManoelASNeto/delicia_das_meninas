import 'package:dartz/dartz.dart';

import '../../../../core/erros/exception.dart';
import '../../../../core/erros/failures.dart';
import '../../domain/entities/highlight_entity.dart';
import '../../domain/repositories/i_highlight_repository.dart';
import '../datasources/highlight_remote_data_source.dart';

class HighLightRepository implements IHighLightRepository {
  final IHomeRemoteDataSource remoteDataSource;

  HighLightRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, List<HighLight>>> highlightList() async {
    try {
      var highLightListModel = await remoteDataSource.highLightList();
      final entity = highLightListModel.map((e) => e.toEntity()).toList();

      return Right(entity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
