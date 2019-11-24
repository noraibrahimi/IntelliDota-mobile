//import 'package:flutter/material.dart';
//
//class HistogramDensityPainter extends CustomPainter {
//
//
//  HistogramDensityPainter(
//    this.points, {
//    this.divisions = 13,
//    this.colors = const [Colors.white, Colors.green],
//  });
//
//  @override
//  void paint(Canvas canvas, Size size) {
//    var histogramBinPaint = Paint()..style = PaintingStyle.fill;
//    var binWidth = size.width / divisions;
//    var binHeight = size.height / divisions;
//
//    var bins = List<List<int>>.generate(
//        divisions, (i) => List<int>.generate(divisions, (j) => 0));
//
//    var maxBinCount = 0;
//
//    getOffsetsForCanvas(size).forEach((offset) {
//      var xBin = min((offset.dx / binWidth).floor(), divisions - 1);
//      var yBin = min((offset.dy / binHeight).floor(), divisions - 1);
//
//      bins[xBin][yBin]++;
//
//      maxBinCount =
//          bins[xBin][yBin] > maxBinCount ? bins[xBin][yBin] : maxBinCount;
//    });
//
//    bins.asMap().forEach((rowIndex, row) {
//      row.asMap().forEach((colIndex, col) {
//        var left = binWidth * rowIndex;
//        var top = binHeight * colIndex;
//        var right = binWidth * (rowIndex + 1);
//        var bottom = binHeight * (colIndex + 1);
//
//        var color = getColor(colors, col / maxBinCount);
//
//        canvas.drawRRect(RRect.fromLTRBR(left, top, right, bottom, Radius.zero),
//            histogramBinPaint..color = color);
//      });
//    });
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return true;
//  }
//}
