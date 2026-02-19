import 'dart:math';

import 'package:flutter/material.dart';

/// A custom painter for drawing a pie chart.
class PieChartPainter extends CustomPainter {
  PieChartPainter({
    required this.data,
    required this.colors,
    this.thickness = 20,
  });

  final Map<String, double> data;
  final List<Color> colors;
  final double thickness;

  @override
  void paint(Canvas canvas, Size size) {
    final double total = data.values.fold(0, (sum, item) => sum + item);
    double startAngle = -pi / 2;
    final Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 2,
    );

    int index = 0;
    for (final entry in data.entries) {
      final sweepAngle = (entry.value / total) * 2 * pi;
      final paint = Paint()
        ..color = colors[index % colors.length]
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.butt;

      canvas.drawArc(rect, startAngle, sweepAngle, false, paint);

      startAngle += sweepAngle;
      index++;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
