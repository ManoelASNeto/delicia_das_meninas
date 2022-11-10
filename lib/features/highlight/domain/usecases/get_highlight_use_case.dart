import 'package:dartz/dartz.dart';

import '../../../../core/erros/failures.dart';
import '../entities/highlight_entity.dart';
import '../repositories/i_highlight_repository.dart';

class GetHighLightUseCase {
  final IHighLightRepository repository;

  GetHighLightUseCase(this.repository);

  Future<Either<Failure, List<HighLight>>> call(event) async {
    return await repository.highlightList();
  }
}
