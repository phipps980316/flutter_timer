import 'package:equatable/equatable.dart';

class SetTimerState extends Equatable {
  final int days;
  final int hours;
  final int minutes;
  final int seconds;

  SetTimerState({
    required this.days,
    required this.hours,
    required this.minutes,
    required this.seconds,
  });

  @override
  List<Object?> get props => [days, hours, minutes, seconds];

  SetTimerState copyWith({
    int? days,
    int? hours,
    int? minutes,
    int? seconds,
  }) {
    return SetTimerState(
      days: days ?? this.days,
      hours: hours ?? this.hours,
      minutes: minutes ?? this.minutes,
      seconds: seconds ?? this.seconds,
    );
  }
}
