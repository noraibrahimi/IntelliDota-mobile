import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';

class PageItem extends StatelessWidget {
  final int num;
  final List values;
  final String keyValue;

  const PageItem({Key key, this.num, this.values, this.keyValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Stack(children: <Widget>[
      Hero(
        tag: "card$num",
        child: Material(
          color: AppColors.defaultColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Card(
                color: AppColors.defaultColor,
                elevation: 0,
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setHeight(100)),
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil.getInstance().setHeight(1500),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil.getInstance().setHeight(40)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          ScreenUtil.getInstance().setHeight(50))),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            '$keyValue',
                            style: TextStyle(
                              fontSize: ScreenUtil.getInstance().setSp(56),
                              fontFamily: AppStrings.fontBold,
                              color: AppColors.defaultColor,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Material(
                              borderRadius: BorderRadius.circular(
                                  ScreenUtil.getInstance().setHeight(50)),
                              color: Colors.white,
                              child: IconButton(
                                icon: Icon(
                                  Icons.close,
                                  size: ScreenUtil.getInstance().setHeight(100),
                                  color: AppColors.defaultColor,
                                ),
                                tooltip: MaterialLocalizations.of(context)
                                    .closeButtonTooltip,
                                onPressed: () {
                                  Navigator.maybePop(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: CupertinoScrollbar(
                          child: ListView.builder(
                              itemCount: values.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      '${values[index].toString()}',
                                      style: TextStyle(
                                        fontSize:
                                            ScreenUtil.getInstance().setSp(56),
                                        fontFamily: AppStrings.fontRegular,
                                        color: AppColors.defaultColor,
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.defaultColor,
                                    ),
                                    SizedBox(
                                      height: ScreenUtil.getInstance()
                                          .setHeight(20),
                                    )
                                  ],
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Column(
        children: <Widget>[
          Container(
            height: mediaQuery.padding.top,
          ),
        ],
      ),
    ]);
  }
}
