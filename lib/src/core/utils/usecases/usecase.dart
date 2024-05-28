import 'package:dartz/dartz.dart';
import 'package:pokeapi/src/core/network/errors/network_failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> execute(Params params);
}
