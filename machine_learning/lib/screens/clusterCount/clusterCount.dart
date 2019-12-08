import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/screens/clusterCount/components/clusteringTab.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';

class ClusteringCountScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringCountScreenState();
  }
}

class _ClusteringCountScreenState extends State<ClusteringCountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                backgroundColor: AppColors.defaultColor,
                appBar: AppBar(
                  backgroundColor: AppColors.defaultColor,
                  leading: IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: ScreenUtil.getInstance().setHeight(100),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text(
                    "IntelliDOTA",
                    style: TextStyle(
                        fontSize: ScreenUtil.getInstance().setSp(70),
                        fontFamily: AppStrings.fontBold),
                  ),
                  bottom: TabBar(
                    indicatorColor: Color(0xff57616f),
                    tabs: [
                      Tab(
                          child: Text(
                        "Kllasterim",
                        style: TextStyle(
                            fontFamily: AppStrings.fontMedium,
                            color: Colors.white),
                      )),
                    ],
                  ),
                  elevation: 0.0,
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[ClusteringTab()],
                ))));
  }
}
