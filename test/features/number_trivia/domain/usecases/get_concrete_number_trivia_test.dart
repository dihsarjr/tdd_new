import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:tdd_new/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:tdd_new/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:tdd_new/features/number_trivia/domain/usecases/get_concrite_number_trivia.dart';

class MockNumberTriviaRepository extends Mock
    implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository);
  });

  final testNumber = 1;
  final testNumberTrivia = NumberTrivia(text: "test", number: 1);
  test("should get trivia from the number from the repository", () async {
    //arrange
    when(mockNumberTriviaRepository.getConcreteNumber(any))
        .thenAnswer((_) async => Right(testNumberTrivia));
    //act
    final result = await usecase.execute(number: testNumber);
    //assert
    expect(result, Right(testNumberTrivia));
    verify(mockNumberTriviaRepository.getConcreteNumber(testNumber));
    verifyNoMoreInteractions(mockNumberTriviaRepository);
  });
}
