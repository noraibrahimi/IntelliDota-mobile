//import 'dart:ui';
//
//import 'package:flutter/material.dart';
//
//abstract class CartesianPlotPainter extends CustomPainter {
//  final List<int> points;
//  final Range defaultXRange;
//  final Range defaultYRange;
//
//  CartesianPlotPainter(
//      this.points, {
//        this.defaultXRange,
//        this.defaultYRange,
//      });
//
//  Range _xRange;
//  Range get xRange {
//    if (_xRange != null) return _xRange;
//    if (defaultXRange != null) return _xRange = defaultXRange;
//
//    var xPoints = points.map((point) => point.x).toList()..sort();
//
//    return _xRange = Range(xPoints.first, xPoints.last);
//  }
//
//  Range _yRange;
//  Range get yRange {
//    if (_yRange != null) return _yRange;
//    if (defaultYRange != null) return _yRange = defaultYRange;
//
//    var yPoints = points.map((point) => point.y).toList()..sort();
//
//    return _yRange = Range(yPoints.first, yPoints.last);
//  }
//
//  List<Offset> getOffsetsForCanvas(Size size) {
//    return points
//        .map((point) => Offset(
//      (point.x - xRange.min) * getHorizontalScaleForCanvas(size),
//      (point.y - yRange.min) * getVerticalScaleForCanvas(size),
//    ))
//        .toList();
//  }
//
//  double getHorizontalScaleForCanvas(Size size) {
//    return size.width / (xRange.max - xRange.min);
//  }
//
//  double getVerticalScaleForCanvas(Size size) {
//    return size.height / (yRange.max - yRange.min);
//  }
//}
//class Range {
//  final double min;
//  final double max;
//
//  Range(this.min, this.max);
//}
//
//class OffsetWithDensity {
//  final Offset offset;
//  final double density;
//
//  OffsetWithDensity(this.offset, this.density);
//}