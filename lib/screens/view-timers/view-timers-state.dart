import 'package:equatable/equatable.dart';
import 'package:timer_example/database/timer-database.dart';

class ViewTimersState extends Equatable {
  final List<Timer> timers;

  ViewTimersState({required this.timers});

  @override
  List<Object?> get props => [timers];

  ViewTimersState copyWith({
    List<Timer>? timers,
  }) {
    return ViewTimersState(
      timers: timers ?? this.timers,
    );
  }
}
