import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_learning/screens/distribution/distribution.dart';
import 'package:machine_learning/screens/splashScreen/splashScreen.dart';
import 'package:machine_learning/screens/stage/stages.dart';
import 'package:machine_learning/screens/tables/tables.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteStrings.rootScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteStrings.distributionScreen:
        return MaterialPageRoute(builder: (_) => DistributionScreen());
      case RouteStrings.stagesScreen:
        return MaterialPageRoute(builder: (_) => StagesScreen());
      case RouteStrings.sampleScreen:
        return MaterialPageRoute(builder: (_) => SampleScreen());
    }
  }
}

class RouteStrings {
  static const String rootScreen = '/';
  static const String distributionScreen = '/distribution';
  static const String stagesScreen = '/stages';
  static const String sampleScreen = '/sample';
}
