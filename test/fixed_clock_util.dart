import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';

class FixedClock {
  static final DateTime _now = DateTime.now();
  static Clock clock = Clock.fixed(DateTime(_now.year, _now.month, _now.day, 0, 0, 0));

  static DateTime now() {
    return withClock(clock, () => clock.now());
  }

  static void setUp(dynamic Function() body) {
    withClock(FixedClock.clock, body);
  }

  static void blocTest<B extends BlocBase<State>, State>(
    String description, {
    required B Function() build,
    FutureOr<void> Function()? setUp,
    State Function()? seed,
    dynamic Function(B bloc)? act,
    Duration? wait,
    int skip = 0,
    dynamic Function()? expect,
    dynamic Function(B bloc)? verify,
    dynamic Function()? errors,
    FutureOr<void> Function()? tearDown,
    dynamic tags,
  }) {
    test(description, () async {
      await withClock(clock, () async {
        await testBloc(
            setUp: setUp,
            build: build,
            seed: seed,
            act: act,
            wait: wait,
            skip: skip,
            expect: expect,
            verify: verify,
            errors: errors,
            tearDown: tearDown);
      });
    }, tags: tags);
  }
}
