part of 'home_cubit.dart';

class HomeState extends Equatable {
  final Length work;
  final Length rest;
  final int lap;

  const HomeState({
    required this.work,
    required this.rest,
    this.lap = 1,
  });

  HomeState copy({Length? work, Length? rest, int? lap}) {
    return HomeState(
      work: work ?? this.work,
      rest: rest ?? this.rest,
      lap: lap ?? this.lap,
    );
  }

  IList<Loop> toLoops() {
    return IList([
      Loop(
        IList([
          Task("Work", work),
          Task("Rest", rest),
        ]),
        lap,
      )
    ]);
  }

  @override
  List<Object?> get props => [work, rest, lap];
}
