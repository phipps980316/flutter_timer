import 'dart:io';

import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'timer-database.g.dart';

class Timers extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get timeSet => integer()();
  IntColumn get duration => integer()();
  IntColumn get timeElapsed => integer()();
  BoolColumn get complete => boolean()();
}

@UseMoor(tables: [Timers])
class TimerDB extends _$TimerDB {
  TimerDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addTimer({
    required int days,
    required int hours,
    required int minutes,
    required int seconds,
  }) async {
    var duration =
        Duration(days: days, hours: hours, minutes: minutes, seconds: seconds)
            .inMilliseconds;
    var timeSet = DateTime.now().millisecondsSinceEpoch;

    return into(timers).insert(TimersCompanion(
        timeSet: Value(timeSet),
        duration: Value(duration),
        timeElapsed: Value(0),
        complete: Value(false)));
  }

  Future<void> removeTimer({required int id}) {
    return (delete(timers)..where((t) => t.id.equals(id))).go();
  }

  Future<void> updateTimer({
    required int id,
    required int elapsed,
  }) async {
    (update(timers)..where((t) => t.id.equals(id)))
        .write(TimersCompanion(timeElapsed: Value(elapsed)));
  }

  Future<void> markAsComplete({
    required int id,
  }) async {
    (update(timers)..where((t) => t.id.equals(id)))
        .write(TimersCompanion(complete: Value(true)));
  }

  Future<List<Timer>> getRunningTimers() async {
    return (select(timers)..where((t) => t.complete.equals(false))).get();
  }

  Stream<List<Timer>> observeTimers() {
    return select(timers).watch();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'timers.sqlite'));
    return VmDatabase(file);
  });
}
