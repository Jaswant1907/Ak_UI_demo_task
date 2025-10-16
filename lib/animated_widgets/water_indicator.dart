import 'package:flutter/material.dart';
import 'dart:math' as math;

class WaterIntakeIndicator extends StatelessWidget {
  final double progress; // e.g., 0.6 means 60%
  final int value; // e.g., 600 ml

  const WaterIntakeIndicator({
    super.key,
    required this.progress,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _WaterIndicatorPainter(progress),
      child: SizedBox(
        width: 200,
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Water Drop
              CustomPaint(
                painter: _WaterDropPainter(progress),
                size: const Size(80, 100),
              ),
              const SizedBox(height: 8),
              Text(
                '$value',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _WaterIndicatorPainter extends CustomPainter {
  final double progress;

  _WaterIndicatorPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 15.0;
    final radius = (size.width / 2) - strokeWidth;
    final center = Offset(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = Colors.grey.shade800
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00AEEF), Color(0xFF007AFF)],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw background arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.75,
      math.pi * 1.5,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      math.pi * 0.75,
      math.pi * 1.5 * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _WaterDropPainter extends CustomPainter {
  final double progress;

  _WaterDropPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0);
    path.quadraticBezierTo(
      size.width,
      size.height * 0.4,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(0, size.height * 0.4, size.width / 2, 0);
    path.close();

    final clipPath = Path.from(path);
    canvas.clipPath(clipPath);

    final waterPaint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF00AEEF), Color(0xFF007AFF)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final waterLevel = size.height * (1 - progress);
    canvas.drawRect(
      Rect.fromLTWH(0, waterLevel, size.width, size.height),
      waterPaint,
    );

    final borderPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
