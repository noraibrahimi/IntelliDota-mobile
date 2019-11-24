import 'dart:math';

import 'package:flutter/material.dart';
import 'package:machine_learning/screens/correlation/components/cartesianPoltPainter.dart';
import 'package:machine_learning/utils/colors.dart';

class PlotPainter extends CartesianPlotPainter {
  final List<double> points;
  int divisions = 13;
  List<Color> colors = const [Colors.white, Colors.black];
  final Range defaultXRange;
  final Range defaultYRange;

  PlotPainter(
    this.points, {
    this.defaultXRange,
    this.defaultYRange,
  }) : super(
          points,
          defaultXRange: defaultXRange,
          defaultYRange: defaultXRange,
        );

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

    paint..style = PaintingStyle.fill;
    var binWidth = size.width / divisions;
    var binHeight = size.height / divisions;

    var bins = List<List<int>>.generate(
        divisions, (i) => List<int>.generate(divisions, (j) => 0));

    var maxBinCount = 0;

    getOffsetsForCanvas(size).forEach((offset) {
      print(">?? ${offset}");
      var xBin = min((offset.dx / binWidth).floor(), divisions - 1);
      var yBin = min((offset.dy / binHeight).floor(), divisions - 1);

//      print(">>>>>>>> ++++ $xBin");
//      print(">>>>>>>>$yBin");

      bins[xBin][yBin]++;

      maxBinCount =
          bins[xBin][yBin] > maxBinCount ? bins[xBin][yBin] : maxBinCount;
    });

    print(bins);

    bins.asMap().forEach((rowIndex, row) {
      row.asMap().forEach((colIndex, col) {
        var left = binWidth * rowIndex;
        var top = binHeight * colIndex;
        var right = binWidth * (rowIndex + 1);
        var bottom = binHeight * (colIndex + 1);

        var color = getColor(colors, col / maxBinCount);

        canvas.drawRRect(RRect.fromLTRBR(left, top, right, bottom, Radius.zero),
            paint..color = color);
      });
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
