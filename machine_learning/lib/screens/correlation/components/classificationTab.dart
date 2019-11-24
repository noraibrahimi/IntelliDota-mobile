import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  double rating = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});
  }

  Widget _buildChart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: ScreenUtil.getInstance().setHeight(65),
              height: ScreenUtil.getInstance().setHeight(1050),
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().setHeight(40),
                  horizontal: ScreenUtil.getInstance().setHeight(5)),
              child: Center(
                child: ListView.builder(
                    itemCount: 13,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil.getInstance().setHeight(15)),
                        child: Text(
                          '${index + 1}',
                          style: TextStyle(
                              color: AppColors.secondaryColor,
                              fontFamily: AppStrings.fontRegular,
                              fontSize: ScreenUtil.getInstance().setHeight(38)),
                        ),
                      );
                    }),
              ),
            ),
            Container(
              width: ScreenUtil.getInstance().setHeight(1000),
              height: ScreenUtil.getInstance().setHeight(1050),
              margin: EdgeInsets.symmetric(
                  vertical: ScreenUtil.getInstance().setHeight(40),
                  horizontal: ScreenUtil.getInstance().setHeight(10)),
              child: ListView.builder(
                  itemCount: 13,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.secondaryColor)),
                      child: Container(
                        width: ScreenUtil.getInstance().setHeight(1000),
                        height: ScreenUtil.getInstance().setHeight(80),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 13,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      ScreenUtil.getInstance().setHeight(35.4),
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColors.secondaryColor)),
                              );
                            }),
                      ),
                    );
                  }),
            ),
          ],
        ),
        Container(
          width: ScreenUtil.getInstance().setHeight(1000),
          height: ScreenUtil.getInstance().setHeight(80),
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil.getInstance().setHeight(10)),
          child: Center(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 13,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil.getInstance().setHeight(22),
                        vertical: ScreenUtil.getInstance().setHeight(15)),
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          color: AppColors.secondaryColor,
                          fontFamily: AppStrings.fontRegular,
                          fontSize: ScreenUtil.getInstance().setHeight(38)),
                    ),
                  );
                }),
          ),
        ),
      ],
    );
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil.getInstance().setHeight(20)),
            child: Column(
              children: <Widget>[
                Expanded(child: _buildChart(context)),
              ],
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0.5),
            child: _loading
                ? Center(
                    child: SpinKitRing(
                      size: 80,
                      color: Colors.white,
                    ),
                  )
                : SizedBox(),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}
