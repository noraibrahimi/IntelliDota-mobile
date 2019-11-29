import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/routes.dart';
import 'package:machine_learning/utils/strings.dart';

class IntelliDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: ScreenUtil.getInstance().setHeight(300),
          padding: EdgeInsets.only(
              bottom: ScreenUtil.getInstance().setHeight(100),
              left: ScreenUtil.getInstance().setHeight(90)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "IntelliDOTA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil.getInstance().setSp(70),
                      fontFamily: AppStrings.fontBold),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(70),
                      right: ScreenUtil.getInstance().setHeight(15)),
                  child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: ScreenUtil.getInstance().setHeight(100),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              )
            ],
          ),
          color: Colors.transparent,
        ),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(20),
        ),
        listItem(
            context: context,
            title: "Shpërndarja",
            routeName: RouteStrings.distributionScreen),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
        listItem(
            context: context,
            title: "Fazat",
            routeName: RouteStrings.stagesScreen),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
        listItem(
            context: context,
            title: "Mostër e të dhënave",
            routeName: RouteStrings.sampleScreen),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
        listItem(
            context: context,
            title: "Matrica e korrelacionit",
            routeName: RouteStrings.correlationScreen),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
        listItem(
            context: context,
            title: "Statistika",
            routeName: RouteStrings.statisticsScreen),
        SizedBox(
          height: ScreenUtil.getInstance().setHeight(10),
        ),
      ],
    );
  }

  Widget listItem({context, title, routeName}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: ScreenUtil.getInstance().setHeight(1100),
        margin: EdgeInsets.only(
          top: ScreenUtil.getInstance().setHeight(20),
        ),
        padding: EdgeInsets.only(
            bottom: ScreenUtil.getInstance().setHeight(40),
            top: ScreenUtil.getInstance().setHeight(40),
            left: ScreenUtil.getInstance().setHeight(60)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "$title",
              style: TextStyle(
                  color: Colors.white, fontFamily: AppStrings.fontLight),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ],
        ),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.white, width: 0.1)),
        ),
      ),
    );
  }
}
