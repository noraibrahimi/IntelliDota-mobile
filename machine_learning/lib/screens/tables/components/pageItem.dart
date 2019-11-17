import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/colors.dart';

class PageItem extends StatelessWidget {
  final int num;

  const PageItem({Key key, this.num}) : super(key: key);

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
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          ScreenUtil.getInstance().setHeight(50))),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:  ScreenUtil.getInstance().setHeight(20)),
                        child: Align(
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
                              tooltip: MaterialLocalizations.of(context).closeButtonTooltip,
                              onPressed: () {
                                Navigator.maybePop(context);
                              },
                            ),
                          ),
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
