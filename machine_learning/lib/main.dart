import 'package:flutter/material.dart';
import 'package:machine_learning/utils/appConfig.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/routes.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  var configuredApp = new AppConfig(
    apiBaseUrl: 'http://192.168.0.240:8083',
    child: new MyApp(),
  );
  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      navigatorKey: navigatorKey,
      theme: ThemeData(
          bottomSheetTheme: BottomSheetThemeData(backgroundColor:Colors.transparent),
        cardColor: Colors.transparent
      ),
    );
  }
}
