import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/strings.dart';

class StringPainter extends CustomPainter {
  String text;
  double angle;

  StringPainter({this.text, this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(100.0, 100.0);
    canvas.rotate(angle);

    TextSpan span =  TextSpan(
        style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getInstance().setSp(42),
            fontFamily: AppStrings.fontMedium),
        text: text);

    TextPainter tp =  TextPainter(
        text: span,
        textAlign: TextAlign.start,
        textDirection: TextDirection.ltr);

    tp.layout();
    tp.paint(canvas,  Offset(-73, 80.0));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
