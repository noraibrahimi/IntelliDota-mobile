import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine_learning/screens/correlation/correlation.dart';
import 'package:machine_learning/screens/distribution/distribution.dart';
import 'package:machine_learning/screens/prediction/prediction.dart';
import 'package:machine_learning/screens/splashScreen/splashScreen.dart';
import 'package:machine_learning/screens/stage/stages.dart';
import 'package:machine_learning/screens/statistics/statistics.dart';
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
      case RouteStrings.correlationScreen:
        return MaterialPageRoute(builder: (_) => CorrelationScreen());
      case RouteStrings.statisticsScreen:
        return MaterialPageRoute(builder: (_) => StatisticsScreen());
      case RouteStrings.predictionScreen:
        return MaterialPageRoute(builder: (_) => PredictionScreen());
    }
  }
}

class RouteStrings {
  static const String rootScreen = '/';
  static const String distributionScreen = '/distribution';
  static const String stagesScreen = '/stages';
  static const String sampleScreen = '/sample';
  static const String correlationScreen = '/correlation';
  static const String statisticsScreen = '/statistics';
  static const String predictionScreen = '/prediction';
}
