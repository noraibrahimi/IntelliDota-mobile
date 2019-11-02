import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/screens/home.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:splashscreen/splashscreen.dart' as splash;

class SplashScreen extends StatelessWidget {
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
      loaderColor: Colors.red,
    );
  }
}
