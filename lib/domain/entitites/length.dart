import 'package:equatable/equatable.dart';

class Length extends Equatable {
  final int _seconds;

  // Length.aaaa({int minutes = 0, int seconds = 0})

  const Length({int minutes = 0, int seconds = 0})
      : this._(minutes * 60 + seconds);

  const Length._(this._seconds);

  int get minutes => _seconds ~/ 60;
  int get seconds => _seconds % 60;
  int get inSeconds => _seconds;

  static Length get zero => const Length();

  @override
  List<Object?> get props => [_seconds];

  Length copy({int? minutes, int? seconds}) {
    return Length(
        minutes: minutes ?? this.minutes, seconds: seconds ?? this.seconds);
  }

  Length incrementMinute() {
    final seconds = _seconds + 60;
    return Length(seconds: seconds);
  }

  Length decrementMinute() {
    final seconds = _seconds - 60;
    return Length(seconds: seconds);
  }

  Length incrementSecond() {
    final seconds = _seconds + 1;
    return Length(seconds: seconds);
  }

  Length decrementSecond() {
    final seconds = _seconds - 1;
    return Length(seconds: seconds);
  }

  @override
  String toString() =>
      "${inSeconds < 0 ? "-" : ""}${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}
