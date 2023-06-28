import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'test_event.dart';
part 'test_state.dart';

class TestBloc extends Bloc<TestEvent, TestState> {
  TestBloc() : super(const TestState()) {
    on<TestEventDateAUpdated>(_onTestEventDateAUpdated);
    on<TestEventDateBUpdated>(_onTestEventDateBUpdated);
  }

  _onTestEventDateAUpdated(TestEventDateAUpdated event, Emitter<TestState> emit) async {
    emit(TestState(dateA: DateTime.now()));
    add(const TestEventDateBUpdated());
  }

  _onTestEventDateBUpdated(TestEventDateBUpdated event, Emitter<TestState> emit) async {
    emit(TestState(dateA: state.dateA, dateB: DateTime.now()));
  }
}
