import 'package:bloc_test/bloc_test.dart';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pinseeker/test_bloc.dart';

import 'fixed_clock_util.dart';

void main() {
  group('TestBloc', () {
    late TestBloc _testBloc;

    setUp(() {
      FixedClock.setUp(() {
        _testBloc = TestBloc();
      });

      // Additionally could do:
      //
      // withClock(FixedClock.clock, () {
      //   _testBloc = TestBloc();
      // });
    });

    group('when TestEventDateAUpdated is added', () {
      FixedClock.blocTest(
        'dateA is set',
        build: () => _testBloc,
        act: (bloc) => bloc.add(const TestEventDateAUpdated()),
        expect: () => [
          TestState(dateA: FixedClock.now()),
          TestState(dateA: FixedClock.now(), dateB: FixedClock.now())
        ],
      );

      test('without FixedClock.blocTest - dateA is set', () async {
        await withClock(FixedClock.clock, () async {
          await testBloc(
              build: () => _testBloc,
              act: (bloc) => bloc.add(const TestEventDateAUpdated()),
              expect: () => [
                    TestState(dateA: FixedClock.now()),
                    TestState(dateA: FixedClock.now(), dateB: FixedClock.now())
                  ]);
        });
      });
    });
  });
}
