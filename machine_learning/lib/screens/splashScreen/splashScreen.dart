import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/screens/home.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await Provider.of<AppState>(context).getColumns(tableType.kaggle);
      await Provider.of<AppState>(context).getColumns(tableType.steam);
    });
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2220)..init(context);

    return Scaffold(
        backgroundColor: AppColors.defaultColor,
        body: Center(
          child: Container(
            height: ScreenUtil.getInstance().setHeight(777),
            width: ScreenUtil.getInstance().setHeight(777),
            child: Image.asset('assets/images/icon.png'),
          ),
        ));
  }
}
