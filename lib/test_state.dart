part of 'test_bloc.dart';

class TestState extends Equatable {
  const TestState({this.dateA, this.dateB});

  final DateTime? dateA;
  final DateTime? dateB;

  @override
  List<dynamic> get props => [dateA, dateB];
}
