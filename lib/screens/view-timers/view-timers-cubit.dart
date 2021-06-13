import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example/database/timer-database.dart' as databases;
import 'package:timer_example/di/dependency-injector.dart';
import 'package:timer_example/screens/view-timers/view-timers-state.dart';

class ViewTimersCubit extends Cubit<ViewTimersState> {
  databases.TimerDB db = I.get();
  Timer? timer;
  StreamSubscription<List<databases.Timer>>? sub;

  ViewTimersCubit() : super(ViewTimersState(timers: [])) {
    timer = Timer.periodic(Duration(milliseconds: 200), (_) => _updateTimers());

    sub = db.observeTimers().listen((timers) {
      emit(state.copyWith(timers: timers));
    });
  }

  @override
  Future<void> close() {
    timer?.cancel();
    sub?.cancel();
    return super.close();
  }

  void cancelTimer(databases.Timer timer){
    db.removeTimer(id: timer.id);
  }

  Future<void> _updateTimers() async {
    final timers = await db.getRunningTimers();
    for (var timer in timers){ 
      _updateTimer(timer);
    }
  }   

  Future<void> _updateTimer(databases.Timer timer) async {
    var now = DateTime.now().millisecondsSinceEpoch;
    var elapsed = now - timer.timeSet;

    db.updateTimer(id: timer.id, elapsed: elapsed);
    
    if(elapsed >= timer.duration){
      db.markAsComplete(id: timer.id);
    }
  }
}