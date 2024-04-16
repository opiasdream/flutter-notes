import 'dart:math';

import 'package:flutter/material.dart';

class VinylClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);

    final innerRadius = min(size.width, size.height) * 0.2;

    final outerRadius = min(size.width, size.height) * 0.5;

    path.addOval(Rect.fromCircle(center: center, radius: innerRadius));

    path.addOval(Rect.fromCircle(center: center, radius: outerRadius));

    path.fillType = PathFillType.evenOdd;

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
