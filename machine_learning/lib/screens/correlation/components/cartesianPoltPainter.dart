import 'dart:ui';

import 'package:flutter/material.dart';

abstract class CartesianPlotPainter extends CustomPainter {
  final List<double> points;
  final Range defaultXRange;
  final Range defaultYRange;

  CartesianPlotPainter(
      this.points, {
        this.defaultXRange,
        this.defaultYRange,
      });

  Range _xRange;
  Range get xRange {
    if (_xRange != null) return _xRange;
    if (defaultXRange != null) return _xRange = defaultXRange;

    var xPoints = points.map((point) => point).toList()..sort();

    return _xRange = Range(xPoints.first, xPoints.last);
  }

  Range _yRange;
  Range get yRange {
    if (_yRange != null) return _yRange;
    if (defaultYRange != null) return _yRange = defaultYRange;

    var yPoints = points.map((point) => point).toList()..sort();

    return _yRange = Range(yPoints.first, yPoints.last);
  }

  List<Offset> getOffsetsForCanvas(Size size) {
    return points
        .map((point) => Offset(
      (point - xRange.min) * getHorizontalAndVerticalScaleForCanvas(size),
      (point - yRange.min) * getHorizontalAndVerticalScaleForCanvas(size),
    ))
        .toList();
  }
  Color getColor(List<Color> colors, double value) {
    var scaledValue = value * (colors.length - 1);
    var firstColorIndex = scaledValue.floor();
    if (firstColorIndex == colors.length - 1) firstColorIndex--;

    return Color.lerp(colors[firstColorIndex], colors[firstColorIndex + 1],
        scaledValue - firstColorIndex)
        .withAlpha(150);
  }
  double getHorizontalAndVerticalScaleForCanvas(Size size) {
    return size.width / (xRange.max - xRange.min);
  }

}
class Range {
  final double min;
  final double max;

  Range(this.min, this.max);
}

class OffsetWithDensity {
  final Offset offset;
  final double density;

  OffsetWithDensity(this.offset, this.density);
}