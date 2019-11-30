import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:machine_learning/models/schema.dart';
import 'package:machine_learning/providers/appState.dart';
import 'package:machine_learning/utils/colors.dart';
import 'package:machine_learning/utils/strings.dart';
import 'package:provider/provider.dart';

class ClusteringTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringTabState();
  }
}

class _ClusteringTabState extends State<ClusteringTab> {
  List<Schema> schema;
  Map<String, dynamic> stats;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      Provider.of<AppState>(context)
          .getSchema(type: tableType.kaggle)
          .then((value) {
        schema = value;
        setState(() {});
      });
      Provider.of<AppState>(context)
          .getStats(type: tableType.kaggle)
          .then((value) {
        stats = value;
        setState(() {});
      });
    });
  }

  Widget _buildBody(context) {
    return SafeArea(
      child: schema == null || stats == null
          ? Container(
          color: Colors.black.withOpacity(0.5),
          child: Center(
            child: SpinKitRing(
              size: 80,
              color: Colors.white,
            ),
          ))
          : Container(
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
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio:
                      ScreenUtil.getInstance().setWidth(650) /
                          (MediaQuery.of(context).size.height / 4),
                    ),
                    itemCount: schema.length,
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: listItem(
                          index: index,
                          front: "${schema[index].column}",
                          back: "${schema[index].type}",
                        ),
                      );
                    }),
              ),
            ),
            Container(
              margin:
              EdgeInsets.all(ScreenUtil.getInstance().setHeight(70)),
              padding:
              EdgeInsets.all(ScreenUtil.getInstance().setHeight(30)),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(
                      ScreenUtil.getInstance().setHeight(40))),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      dataColumns()[0],
                      dataColumns()[1],
                      dataColumns()[2],
                    ],
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      dataRows()[0],
                      dataRows()[1],
                      dataRows()[2],
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget listItem({index, front, back}) {
    return FlipCard(
      front: Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(100),
        margin: EdgeInsets.all(
          ScreenUtil.getInstance().setHeight(30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setHeight(25),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "${front.toUpperCase()}",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.defaultColor,
                fontFamily: AppStrings.fontBold,
                fontSize: ScreenUtil.getInstance().setSp(35)),
          ),
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
      back: Container(
        width: double.infinity,
        height: ScreenUtil.getInstance().setHeight(100),
        margin: EdgeInsets.all(
          ScreenUtil.getInstance().setHeight(30),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil.getInstance().setHeight(20),
        ),
        child: Align(
          alignment: Alignment.center,
          child: FittedBox(
            child: Text(
              "${back.toUpperCase()}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: AppStrings.fontBold,
                  fontSize: ScreenUtil.getInstance().setSp(35)),
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius:
          BorderRadius.circular(ScreenUtil.getInstance().setHeight(12)),
          border: Border.all(
            color: AppColors.defaultColor.withOpacity(0.3),
          ),
        ),
      ),
    );
  }

  List<Widget> dataColumns() {
    List<Widget> widgets = [];
    stats.forEach((key, value) {
      widgets.add(Text('${key.toUpperCase()}',
          style: TextStyle(
              color: Colors.white, fontFamily: AppStrings.fontMedium)));
    });
    return widgets;
  }

  List<Widget> dataRows() {
    List<Widget> widgets = [];
    stats.forEach((key, value) {
      widgets.add(Text(
        '${value.toUpperCase()}',
        style: TextStyle(color: Colors.white, fontFamily: AppStrings.fontLight),
      ));
    });
    return widgets;
  }
}
