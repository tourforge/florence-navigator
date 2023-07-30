import 'package:flutter/material.dart';
import 'package:opentourguide/opentourguide.dart';

import 'onboarding.dart';
import 'theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runOpenTourGuide(
    config: OpenTourGuideConfig(
      appName: "Florence Navigator",
      appDesc:
          '''Florence Navigator is a GPS-based tour guide app for Florence, South Carolina built using OpenTourBuilder.''',
      baseUrl: "https://fsrv.fly.dev/v2",
      lightThemeData: lightThemeData,
      darkThemeData: darkThemeData,
    ),
    onboarding: (context, finish) {
      return Onboarding(finish: finish);
    },
  );
}
