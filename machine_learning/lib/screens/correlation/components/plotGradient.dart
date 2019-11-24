import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';

class BuildGradient extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin:
            EdgeInsets.only(bottom: ScreenUtil.getInstance().setHeight(10)),
            width: ScreenUtil.getInstance().setWidth(600),
            height: ScreenUtil.getInstance().setWidth(60),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white.withOpacity(0.2)),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [
                    0.0,
                    0.3,
                    0.5,
                    0.7,
                    1.0,
                  ],
                  colors: <Color>[
                    Colors.white,
                    Colors.white.withOpacity(0.5),
                    AppColors.defaultColor,
                    Colors.white.withOpacity(0.5),
                    Colors.white
                  ]),
            )),
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(20)),
            width: ScreenUtil.getInstance().setWidth(580),
            height: ScreenUtil.getInstance().setWidth(50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('1',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white)),
                Text('0',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white)),
                Text('-1',
                    style: TextStyle(
                        fontFamily: AppStrings.fontRegular,
                        color: Colors.white))
              ],
            )),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(35),
        ),
      ],
    );
  }

}
