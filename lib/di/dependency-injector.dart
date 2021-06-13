import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:timer_example/database/timer-database.dart';

final I = Injector();

buildInjector() {
  I.map<TimerDB>((i) => TimerDB(), isSingleton: true);
}
