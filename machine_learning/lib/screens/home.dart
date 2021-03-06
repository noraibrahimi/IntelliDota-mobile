import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/screens/components/drawer.dart';
import 'package:machine_learning/screens/components/mainBackground.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

double expandedHeight = ScreenUtil.getInstance().setHeight(600);

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 1080, height: 2220)..init(context);
    return Stack(
      children: <Widget>[
        MainBackground(),
        Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          endDrawer: SizedBox(
            width: double.infinity,
            child: Drawer(
              child: Container(
                  color: AppColors.defaultColor, child: IntelliDrawer()),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            actions: [
              Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.dehaze,
                    size: ScreenUtil.getInstance().setHeight(90),
                  ),
                  onPressed: () => Scaffold.of(context).openEndDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              ),
            ],
          ),
          body: _buildBody(context),
        ),
      ],
    );
  }

  Widget _buildBody(context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(ScreenUtil.getInstance().setHeight(50)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "IntelliDOTA",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppStrings.fontMedium,
                      fontSize: ScreenUtil.getInstance().setSp(150)),
                ),
                Text(
                  "MËSIMI I MAKINËS",
                  style: TextStyle(
                      color: AppColors.secondaryColor,
                      fontFamily: AppStrings.fontMedium,
                      fontSize: ScreenUtil.getInstance().setSp(50)),
                )
              ],
            ),
          ),
          SlidingUpPanel(
              borderRadius: BorderRadius.circular(
                  ScreenUtil.getInstance().setHeight(100)),
              collapsed: Container(
                height: ScreenUtil.getInstance().setHeight(300),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        ScreenUtil.getInstance().setHeight(200)),
                    topRight: Radius.circular(
                        ScreenUtil.getInstance().setHeight(200)),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setHeight(50)),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(20)),
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: Icon(
                              Icons.dehaze,
                              color: AppColors.defaultColor.withOpacity(0.4),
                              size: ScreenUtil.getInstance().setHeight(70),
                            )),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: ScreenUtil.getInstance().setHeight(50)),
                        child: Text(
                          "Mësoni më shumë rreth asaj që përfshihet në projekt",
                          style: TextStyle(
                              color: AppColors.defaultColor.withOpacity(0.4),
                              fontSize: ScreenUtil.getInstance().setSp(38)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              panel: Container(
                height: ScreenUtil.getInstance().setHeight(1200),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        ScreenUtil.getInstance().setHeight(200)),
                    topRight: Radius.circular(
                        ScreenUtil.getInstance().setHeight(200)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      top: ScreenUtil.getInstance().setHeight(20)),
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Icon(
                        Icons.dehaze,
                        color: AppColors.defaultColor.withOpacity(0.4),
                        size: ScreenUtil.getInstance().setHeight(70),
                      )),
                ),
              )),
        ],
      ),
    );
  }
}
