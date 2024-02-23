import 'package:flutter/material.dart';
import 'package:tourforge/tourforge.dart';

import 'onboarding.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runTourForge(
    config: TourForgeConfig(
      appName: "Florence Navigator",
      appDesc:
          '''Florence Navigator is a GPS-based tour guide app for Florence, South Carolina built using TourForge.''',
      baseUrl: "https://fsrv.fly.dev/v2",
      lightThemeData: lightThemeData,
      darkThemeData: darkThemeData,
    ),
    onboarding: (context, finish) {
      return Onboarding(finish: finish);
    },
  );
}
