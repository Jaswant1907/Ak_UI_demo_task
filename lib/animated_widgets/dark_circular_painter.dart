import 'package:flutter/material.dart';
import 'dart:math';

class DashedCirclePainter extends CustomPainter {
  final double strokeWidth;
  final Color color;
  final int numberOfDashes;
  final double dashSpace;

  DashedCirclePainter({
    this.strokeWidth = 2.0,
    this.color = Colors.white,
    this.numberOfDashes = 20,
    this.dashSpace = 5.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final dashLength = (2 * pi * radius) / numberOfDashes - dashSpace;

    for (int i = 0; i < numberOfDashes; i++) {
      final startAngle = (i * (2 * pi / numberOfDashes));
      final endAngle = startAngle + (dashLength / radius);

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        endAngle - startAngle, // Use the calculated dashLength to determine arc extent
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // Repaint when needed
  }
}