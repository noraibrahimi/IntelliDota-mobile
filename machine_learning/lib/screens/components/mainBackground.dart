import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/colors.dart';

class MainBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.defaultColor,
        body: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Spacer(),
                Opacity(
                  opacity: 0.7,
                  child: Container(
                    height: ScreenUtil.getInstance().setHeight(1300),
                    width: 1200,
                    margin: EdgeInsets.only(left: ScreenUtil.getInstance().setHeight(80)),
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                         alignment: Alignment(-0.5, 0),
                        image: AssetImage('assets/images/homeBack.png'),

                        //fit: BoxFit.scaleDown
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
