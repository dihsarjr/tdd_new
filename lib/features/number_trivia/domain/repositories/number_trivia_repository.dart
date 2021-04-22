import 'package:dartz/dartz.dart';
import 'package:tdd_new/core/error/failures.dart';
import 'package:tdd_new/features/number_trivia/domain/entities/number_trivia.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumber(int number);
  Future<Either<Failure, NumberTrivia>> getRandomNumber();
}
