import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

class ClassificationTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClassificationTabState();
  }
}

class _ClassificationTabState extends State<ClassificationTab> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {});
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: ScreenUtil.getInstance().setHeight(20)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ScreenUtil.getInstance().setHeight(100),
            ),
            Expanded(
              child: Container(
                constraints: BoxConstraints(
                    maxHeight: ScreenUtil.getInstance().setHeight(1000)),
                margin: EdgeInsets.symmetric(
                    horizontal: ScreenUtil.getInstance().setHeight(50)),
                child: GridView.builder(
                    primary: false,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: ScreenUtil.getInstance().setWidth(650) /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    itemCount:
                        Provider.of<AppState>(context).steamColumnNames.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: listItem(
                            index: index,
                            title:
                                "${Provider.of<AppState>(context).steamColumnNames[index]}",
                            color: AppColors()
                                .makeColor(
                                    index,
                                    Provider.of<AppState>(context)
                                        .steamColumnNames
                                        .length
                                        .toDouble(),
                                    0.5,
                                    0.5)
                                .toColor()
                                .withOpacity(0.3),
                            isSelected: false),
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget listItem({index, title, color, isSelected}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(100),
        margin: EdgeInsets.all(
          ScreenUtil.getInstance().setHeight(30),
        ),
        padding: EdgeInsets.only(
          top: title.toString().split('_').length > 1
              ? ScreenUtil.getInstance().setHeight(55)
              : ScreenUtil.getInstance().setHeight(80),
        ),
        child: Column(
          children: <Widget>[
            Text(
              "${title.toString().split('_').first.toUpperCase()}",
              maxLines: 2,
              style: TextStyle(
                  color: AppColors.defaultColor,
                  fontFamily: AppStrings.fontBold,
                  fontSize: ScreenUtil.getInstance().setSp(38)),
            ),
            Text(
              "${title.toString().split('_').length > 1 ? title.toString().split('_').removeAt(1) : ""} ${title.toString().split('_').length > 2 ? title.toString().split('_').removeAt(2) : ""}",
              maxLines: 2,
              style: TextStyle(
                  color: Color(0xff57616f),
                  fontFamily: AppStrings.fontMedium,
                  fontSize: ScreenUtil.getInstance().setSp(36)),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(ScreenUtil.getInstance().setHeight(12)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.3),
          ),
        ),
      ),
    );
  }
}
