import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/screens/home.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart' as splash;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<AppState>(context).getColumns(tableType.kaggle);
      await Provider.of<AppState>(context).getColumns(tableType.steam);
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2220)..init(context);

    return Scaffold(
        backgroundColor: AppColors.defaultColor,
        body: _buildBody(context),
       );
  }

  Widget _buildBody(context) {
    return splash.SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomeScreen(),
      image: Image.asset('assets/images/icon.png'),
      backgroundColor: AppColors.defaultColor,
      photoSize: ScreenUtil.getInstance().setHeight(300),
      loaderColor: Color(0xff24D3DD),
    );
  }
}
