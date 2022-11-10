import 'package:dartz/dartz.dart';
import 'package:loja_delicia_das_meninas/core/erros/failures.dart';
import 'package:loja_delicia_das_meninas/features/highlight/domain/entities/highlight_entity.dart';

abstract class IHighLightRepository {
  Future<Either<Failure, List<HighLight>>> highlightList();
}
