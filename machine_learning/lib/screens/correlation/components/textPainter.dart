import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine_learning/utils/strings.dart';

class StringPainter extends CustomPainter {
  String text;
  double angle;
  Offset position;

  StringPainter({this.text, this.angle,this.position});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(0.0, 0.0);
    canvas.rotate(angle);
    TextSpan span = TextSpan(
        style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil.getInstance().setSp(32),
            fontFamily: AppStrings.fontMedium),
        text: text);

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.right,
        textDirection: TextDirection.ltr);

    tp.layout(maxWidth: size.width);
    tp.paint(canvas, position);
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
