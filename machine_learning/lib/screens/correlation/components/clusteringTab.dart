import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/screens/correlation/components/plotPainter.dart';

class ClusteringTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ClusteringTabState();
  }
}

class _ClusteringTabState extends State<ClusteringTab> {
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
            Container(
              width: ScreenUtil.getInstance().setHeight(950),
              height: ScreenUtil.getInstance().setHeight(950),
              margin: EdgeInsets.symmetric(
                  horizontal: ScreenUtil.getInstance().setHeight(50)),
              child: CustomPaint(
                painter: PlotPainter([2, 3, 4, 5,6,7,8,9,10]),
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
}
