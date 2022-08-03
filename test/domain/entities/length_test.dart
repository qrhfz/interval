import 'package:flutter_test/flutter_test.dart';
import 'package:interval/domain/entitites/length.dart';

void main() {
  group('length test', () {
    test("equality test", () {
      var a = const Length(minutes: 1);
      var b = const Length(minutes: 1);

      assert(a == b);

      b = const Length(minutes: 2);

      assert(a != b);
    });

    test("inSeconds getter", () {
      var a = const Length(minutes: 1, seconds: 30);

      assert(a.inSeconds == 90);
    });

    test("minutes getter", () {
      var a = const Length(minutes: 1, seconds: 30);

      assert(a.minutes == 1);
    });

    test("seconds getter", () {
      var a = const Length(minutes: 1, seconds: 30);

      assert(a.seconds == 30);
    });

    test("increment second", () {
      var a = const Length();
      var b = a.incrementSecond();
      assert(b.inSeconds == 1);
    });

    test("decrement second", () {
      var a = const Length();
      var b = a.decrementSecond();
      assert(b.inSeconds == -1);
    });

    test("increment minute", () {
      var a = const Length();
      var b = a.incrementMinute();
      assert(b.inSeconds == 60);
    });

    test("decrement minute", () {
      var a = const Length();
      var b = a.decrementMinute();
      assert(b.inSeconds == -60);
    });

    test("toString", () {
      var a = const Length(minutes: 1, seconds: 30);
      assert(a.toString() == "01:30");

      var b = const Length(minutes: -1, seconds: 30);
      assert(b.toString() == "-00:30");
    });
  });
}
