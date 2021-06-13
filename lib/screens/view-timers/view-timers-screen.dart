import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example/screens/set-timer/set-timer-cubit.dart';
import 'package:timer_example/screens/set-timer/set-timer-screen.dart';
import 'package:timer_example/screens/view-timers/view-timers-cubit.dart';
import 'package:timer_example/screens/view-timers/view-timers-state.dart';

class ViewTimersScreen extends StatelessWidget {
  const ViewTimersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timers"),
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocBuilder<ViewTimersCubit, ViewTimersState>(
              builder: (context, state) => ListView.builder(
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                            "Timer ${index + 1} - ${Duration(milliseconds: state.timers[index].duration).toString().split(".").first}"),
                        LinearProgressIndicator(
                          value: (state.timers[index].timeElapsed.toDouble() /
                              state.timers[index].duration.toDouble()),
                        ),
                        ElevatedButton(
                            onPressed: () =>
                                BlocProvider.of<ViewTimersCubit>(context).cancelTimer(state.timers[index]),
                            child: Text("Cancel")),
                      ],
                    ),
                  ),
                ),
                itemCount: state.timers.length,
              ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider(
                create: (_) => SetTimerCubit(),
                child: SetTimerScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}
