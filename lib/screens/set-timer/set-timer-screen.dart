import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_example/screens/set-timer/set-timer-cubit.dart';
import 'package:timer_example/screens/set-timer/set-timer-state.dart';

class SetTimerScreen extends StatelessWidget {
  const SetTimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Timer"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: BlocBuilder<SetTimerCubit, SetTimerState>(
                  builder: (context, state) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "D",
                            style: TextStyle(fontSize: 36),
                          ),
                          SizedBox(height: 30.0),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .addDay(),
                              icon: Icon(Icons.exposure_plus_1_rounded)),
                          Text(
                            state.days.toString(),
                            style: TextStyle(fontSize: 48),
                          ),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .minusDay(),
                              icon: Icon(Icons.exposure_minus_1_rounded)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "H",
                            style: TextStyle(fontSize: 36),
                          ),
                          SizedBox(height: 30.0),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .addHour(),
                              icon: Icon(Icons.exposure_plus_1_rounded)),
                          Text(
                            state.hours.toString(),
                            style: TextStyle(fontSize: 48),
                          ),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .minusHour(),
                              icon: Icon(Icons.exposure_minus_1_rounded)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "M",
                            style: TextStyle(fontSize: 36),
                          ),
                          SizedBox(height: 30.0),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .addMinute(),
                              icon: Icon(Icons.exposure_plus_1_rounded)),
                          Text(
                            state.minutes.toString(),
                            style: TextStyle(fontSize: 48),
                          ),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .minusMinute(),
                              icon: Icon(Icons.exposure_minus_1_rounded)),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "S",
                            style: TextStyle(fontSize: 36),
                          ),
                          SizedBox(height: 30.0),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .addSecond(),
                              icon: Icon(Icons.exposure_plus_1_rounded)),
                          Text(
                            state.seconds.toString(),
                            style: TextStyle(fontSize: 48),
                          ),
                          IconButton(
                              onPressed: () =>
                                  BlocProvider.of<SetTimerCubit>(context)
                                      .minusSecond(),
                              icon: Icon(Icons.exposure_minus_1_rounded)),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                            BlocProvider.of<SetTimerCubit>(context).setTimer();
                            Navigator.pop(context);
                        },
                        child: Text("Set Timer")))
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
