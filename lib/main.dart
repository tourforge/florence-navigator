import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:opentourguide/opentourguide.dart';
import 'package:opentourguide/theme.dart';

import 'home.dart';

Future<void> main() async {
  await otbGuideInit(const OtbGuideAppConfig(
    appName: "Florence Navigator",
    appDesc:
        '''Florence Navigator is a GPS-based tour guide app for Florence, South Carolina built using OpenTourBuilder.''',
    baseUrl: "https://fsrv.fly.dev/v2",
  ));
  runApp(const FloNavApp());
}

class FloNavApp extends StatelessWidget {
  const FloNavApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Florence Navigator',
      theme: SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? darkThemeData
          : lightThemeData,
      builder: (context, child) {
        if (child != null) {
          return ScrollConfiguration(
            behavior: const BouncingScrollBehavior(),
            child: child,
          );
        } else {
          return const SizedBox();
        }
      },
      home: const Home(),
    );
  }
}

class BouncingScrollBehavior extends ScrollBehavior {
  const BouncingScrollBehavior();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}
