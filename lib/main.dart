import 'dart:io';

import 'package:florence_navigator/home.dart';
import 'package:florence_navigator/onboarding.dart';
import 'package:florence_navigator/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:opentourguide/opentourguide.dart';

Future<void> main() async {
  await otbGuideInit(OtbGuideAppConfig(
    appName: "Florence Navigator",
    appDesc:
        '''Florence Navigator is a GPS-based tour guide app for Florence, South Carolina built using OpenTourBuilder.''',
    baseUrl: "https://fsrv.fly.dev/v2",
    lightThemeData: lightThemeData,
    darkThemeData: darkThemeData,
  ));

  var onboarded = await isOnboarded();
  runApp(FloNavApp(onboarded: onboarded));
}

class FloNavApp extends StatelessWidget {
  const FloNavApp({super.key, required this.onboarded});

  final bool onboarded;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Florence Navigator',
      theme: SchedulerBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark
          ? darkThemeData
          : lightThemeData,
      debugShowCheckedModeBanner: false,
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
      home: onboarded ? const Home() : const Onboarding(),
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
