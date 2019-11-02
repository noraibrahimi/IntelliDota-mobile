import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_learning/screens/distribution/distribution.dart';
import 'package:machine_learning/screens/splashScreen/splashScreen.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteStrings.rootScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case RouteStrings.distributionScreen:
        return MaterialPageRoute(builder: (_) => DistributionScreen());
    }
  }
}

class RouteStrings {
  static const String rootScreen = '/';
  static const String distributionScreen = '/distribution';
}
