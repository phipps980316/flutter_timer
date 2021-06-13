import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example/di/dependency-injector.dart';
import 'package:timer_example/screens/view-timers/view-timers-cubit.dart';
import 'package:timer_example/screens/view-timers/view-timers-screen.dart';

void main() {
  buildInjector();

  runApp(
    MaterialApp(
      title: 'Flutter Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => ViewTimersCubit(),
        child: ViewTimersScreen(),
      ),
    ),
  );
}
