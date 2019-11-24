import 'package:flutter/material.dart';
import 'package:machine_learning/utils/colors.dart';

class PlotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = AppColors.secondaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0
      ..isAntiAlias = true;
    var rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    for (int i = 0; i <= 13; i++) {
      canvas.drawLine(
        Offset(0, i * size.height / 13),
        Offset(size.width, i * size.height / 13),
        paint,
      );
      canvas.drawLine(
        Offset(i * size.height / 13, 0),
        Offset(i * size.height / 13, size.height),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
