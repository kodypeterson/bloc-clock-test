part of 'test_bloc.dart';

abstract class TestEvent extends Equatable {
  const TestEvent();

  @override
  List<Object?> get props => [];
}

class TestEventDateAUpdated extends TestEvent {
  const TestEventDateAUpdated();
}

class TestEventDateBUpdated extends TestEvent {
  const TestEventDateBUpdated();
}
