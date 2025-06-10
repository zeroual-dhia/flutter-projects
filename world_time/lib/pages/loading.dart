import 'package:flutter/material.dart';

import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime wTime =
        WorldTime(location: 'Paris', flag: 'germany.png', url: 'Europe/Paris');
    await wTime.getTime();
    Navigator.pushNamed(context, '/home', arguments: {
      'time': wTime.time,
      'flag': wTime.flag,
      'location': wTime.location,
      'isDayTime': wTime.isDayTime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body: Center(
          child: SpinKitThreeInOut(
            size: 35,
            color: Colors.white,
          ),
        ));
  }
}
