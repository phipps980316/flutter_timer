import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example/database/timer-database.dart';
import 'package:timer_example/di/dependency-injector.dart';
import 'package:timer_example/screens/set-timer/set-timer-state.dart';

class SetTimerCubit extends Cubit<SetTimerState> {
  TimerDB db = I.get();

  SetTimerCubit()
      : super(SetTimerState(
          days: 0,
          hours: 0,
          minutes: 0,
          seconds: 0,
        ));

  addDay() {
    emit(state.copyWith(days: state.days + 1));
  }

  minusDay() {
    if (state.days > 0) {
      emit(state.copyWith(days: state.days - 1));
    }
  }

  addHour() {
    if (state.hours < 23) {
      emit(state.copyWith(hours: state.hours + 1));
    }
  }

  minusHour() {
    if (state.hours > 0) {
      emit(state.copyWith(hours: state.hours - 1));
    }
  }

  addMinute() {
    if (state.minutes < 59) {
      emit(state.copyWith(minutes: state.minutes + 1));
    }
  }

  minusMinute() {
    if (state.minutes > 0) {
      emit(state.copyWith(minutes: state.minutes - 1));
    }
  }

  addSecond() {
    if (state.seconds < 59) {
      emit(state.copyWith(seconds: state.seconds + 1));
    }
  }

  minusSecond() {
    if (state.seconds > 0) {
      emit(state.copyWith(seconds: state.seconds - 1));
    }
  }

  setTimer() {
    db.addTimer(
      days: state.days,
      hours: state.hours,
      minutes: state.minutes,
      seconds: state.seconds,
    );
  }
}
