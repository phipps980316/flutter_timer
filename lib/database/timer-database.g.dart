// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer-database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Timer extends DataClass implements Insertable<Timer> {
  final int id;
  final int timeSet;
  final int duration;
  final int timeElapsed;
  final bool complete;
  Timer(
      {required this.id,
      required this.timeSet,
      required this.duration,
      required this.timeElapsed,
      required this.complete});
  factory Timer.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Timer(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      timeSet: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_set'])!,
      duration: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}duration'])!,
      timeElapsed: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time_elapsed'])!,
      complete: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}complete'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['time_set'] = Variable<int>(timeSet);
    map['duration'] = Variable<int>(duration);
    map['time_elapsed'] = Variable<int>(timeElapsed);
    map['complete'] = Variable<bool>(complete);
    return map;
  }

  TimersCompanion toCompanion(bool nullToAbsent) {
    return TimersCompanion(
      id: Value(id),
      timeSet: Value(timeSet),
      duration: Value(duration),
      timeElapsed: Value(timeElapsed),
      complete: Value(complete),
    );
  }

  factory Timer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Timer(
      id: serializer.fromJson<int>(json['id']),
      timeSet: serializer.fromJson<int>(json['timeSet']),
      duration: serializer.fromJson<int>(json['duration']),
      timeElapsed: serializer.fromJson<int>(json['timeElapsed']),
      complete: serializer.fromJson<bool>(json['complete']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'timeSet': serializer.toJson<int>(timeSet),
      'duration': serializer.toJson<int>(duration),
      'timeElapsed': serializer.toJson<int>(timeElapsed),
      'complete': serializer.toJson<bool>(complete),
    };
  }

  Timer copyWith(
          {int? id,
          int? timeSet,
          int? duration,
          int? timeElapsed,
          bool? complete}) =>
      Timer(
        id: id ?? this.id,
        timeSet: timeSet ?? this.timeSet,
        duration: duration ?? this.duration,
        timeElapsed: timeElapsed ?? this.timeElapsed,
        complete: complete ?? this.complete,
      );
  @override
  String toString() {
    return (StringBuffer('Timer(')
          ..write('id: $id, ')
          ..write('timeSet: $timeSet, ')
          ..write('duration: $duration, ')
          ..write('timeElapsed: $timeElapsed, ')
          ..write('complete: $complete')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          timeSet.hashCode,
          $mrjc(duration.hashCode,
              $mrjc(timeElapsed.hashCode, complete.hashCode)))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Timer &&
          other.id == this.id &&
          other.timeSet == this.timeSet &&
          other.duration == this.duration &&
          other.timeElapsed == this.timeElapsed &&
          other.complete == this.complete);
}

class TimersCompanion extends UpdateCompanion<Timer> {
  final Value<int> id;
  final Value<int> timeSet;
  final Value<int> duration;
  final Value<int> timeElapsed;
  final Value<bool> complete;
  const TimersCompanion({
    this.id = const Value.absent(),
    this.timeSet = const Value.absent(),
    this.duration = const Value.absent(),
    this.timeElapsed = const Value.absent(),
    this.complete = const Value.absent(),
  });
  TimersCompanion.insert({
    this.id = const Value.absent(),
    required int timeSet,
    required int duration,
    required int timeElapsed,
    required bool complete,
  })  : timeSet = Value(timeSet),
        duration = Value(duration),
        timeElapsed = Value(timeElapsed),
        complete = Value(complete);
  static Insertable<Timer> custom({
    Expression<int>? id,
    Expression<int>? timeSet,
    Expression<int>? duration,
    Expression<int>? timeElapsed,
    Expression<bool>? complete,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (timeSet != null) 'time_set': timeSet,
      if (duration != null) 'duration': duration,
      if (timeElapsed != null) 'time_elapsed': timeElapsed,
      if (complete != null) 'complete': complete,
    });
  }

  TimersCompanion copyWith(
      {Value<int>? id,
      Value<int>? timeSet,
      Value<int>? duration,
      Value<int>? timeElapsed,
      Value<bool>? complete}) {
    return TimersCompanion(
      id: id ?? this.id,
      timeSet: timeSet ?? this.timeSet,
      duration: duration ?? this.duration,
      timeElapsed: timeElapsed ?? this.timeElapsed,
      complete: complete ?? this.complete,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (timeSet.present) {
      map['time_set'] = Variable<int>(timeSet.value);
    }
    if (duration.present) {
      map['duration'] = Variable<int>(duration.value);
    }
    if (timeElapsed.present) {
      map['time_elapsed'] = Variable<int>(timeElapsed.value);
    }
    if (complete.present) {
      map['complete'] = Variable<bool>(complete.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimersCompanion(')
          ..write('id: $id, ')
          ..write('timeSet: $timeSet, ')
          ..write('duration: $duration, ')
          ..write('timeElapsed: $timeElapsed, ')
          ..write('complete: $complete')
          ..write(')'))
        .toString();
  }
}

class $TimersTable extends Timers with TableInfo<$TimersTable, Timer> {
  final GeneratedDatabase _db;
  final String? _alias;
  $TimersTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedIntColumn id = _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _timeSetMeta = const VerificationMeta('timeSet');
  @override
  late final GeneratedIntColumn timeSet = _constructTimeSet();
  GeneratedIntColumn _constructTimeSet() {
    return GeneratedIntColumn(
      'time_set',
      $tableName,
      false,
    );
  }

  final VerificationMeta _durationMeta = const VerificationMeta('duration');
  @override
  late final GeneratedIntColumn duration = _constructDuration();
  GeneratedIntColumn _constructDuration() {
    return GeneratedIntColumn(
      'duration',
      $tableName,
      false,
    );
  }

  final VerificationMeta _timeElapsedMeta =
      const VerificationMeta('timeElapsed');
  @override
  late final GeneratedIntColumn timeElapsed = _constructTimeElapsed();
  GeneratedIntColumn _constructTimeElapsed() {
    return GeneratedIntColumn(
      'time_elapsed',
      $tableName,
      false,
    );
  }

  final VerificationMeta _completeMeta = const VerificationMeta('complete');
  @override
  late final GeneratedBoolColumn complete = _constructComplete();
  GeneratedBoolColumn _constructComplete() {
    return GeneratedBoolColumn(
      'complete',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, timeSet, duration, timeElapsed, complete];
  @override
  $TimersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'timers';
  @override
  final String actualTableName = 'timers';
  @override
  VerificationContext validateIntegrity(Insertable<Timer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('time_set')) {
      context.handle(_timeSetMeta,
          timeSet.isAcceptableOrUnknown(data['time_set']!, _timeSetMeta));
    } else if (isInserting) {
      context.missing(_timeSetMeta);
    }
    if (data.containsKey('duration')) {
      context.handle(_durationMeta,
          duration.isAcceptableOrUnknown(data['duration']!, _durationMeta));
    } else if (isInserting) {
      context.missing(_durationMeta);
    }
    if (data.containsKey('time_elapsed')) {
      context.handle(
          _timeElapsedMeta,
          timeElapsed.isAcceptableOrUnknown(
              data['time_elapsed']!, _timeElapsedMeta));
    } else if (isInserting) {
      context.missing(_timeElapsedMeta);
    }
    if (data.containsKey('complete')) {
      context.handle(_completeMeta,
          complete.isAcceptableOrUnknown(data['complete']!, _completeMeta));
    } else if (isInserting) {
      context.missing(_completeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Timer map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Timer.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $TimersTable createAlias(String alias) {
    return $TimersTable(_db, alias);
  }
}

abstract class _$TimerDB extends GeneratedDatabase {
  _$TimerDB(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TimersTable timers = $TimersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [timers];
}
