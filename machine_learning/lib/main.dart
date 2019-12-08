import 'package:flutter/material.dart';
import 'package:machine_learning/utils/appConfig.dart';
import 'package:machine_learning/utils/routes.dart';
import 'package:provider/provider.dart';

import 'providers/appState.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

void main() {
  var configuredApp = new AppConfig(
    apiBaseUrl: 'https://serverfinal3-qm4ka2ucaq-ew.a.run.app',
    child: new MyApp(),
  );
  runApp(configuredApp);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => AppState()),
        ],
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          navigatorKey: navigatorKey,
          theme: ThemeData(
              bottomSheetTheme:
                  BottomSheetThemeData(backgroundColor: Colors.transparent),
              cardColor: Colors.transparent),
        ));
  }
}
