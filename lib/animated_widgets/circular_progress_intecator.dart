import 'package:flutter/material.dart';

class CircularProgressIndicatorWithNumber extends StatelessWidget {
  final double progress; // Value from 0.0 to 1.0
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle textStyle;

  const CircularProgressIndicatorWithNumber({
    Key? key,
    required this.progress,
    this.strokeWidth = 10.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.orange,
    this.textStyle = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // The CustomPaint widget is used to draw the circular background and progress arcs.
        SizedBox(
          width: 45,
          height: 45,
          child: CustomPaint(
            painter: _CircularProgressPainter(
              progress: progress,
              strokeWidth: strokeWidth,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
          ),
        ),
        // The Text widget displays the progress percentage.
        Text(
          '${(progress * 100).toInt()}',
          style: textStyle,
        ),
      ],
    );
  }
}

// A custom painter class to draw the arcs for the progress indicator.
class _CircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  _CircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.backgroundColor,
    required this.progressColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Defines the painting style for the background circle.
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Defines the painting style for the progress arc.
    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Determines the center point of the canvas.
    final center = Offset(size.width / 2, size.height / 2);
    // Defines the radius of the circle.
    final radius = (size.width - strokeWidth) / 2;

    // Draws the full background circle.
    canvas.drawCircle(center, radius, backgroundPaint);

    // Calculates the sweep angle for the progress arc (from 0 to 360 degrees, or 2 * pi radians).
    final sweepAngle = 2 * 3.14159265359 * progress;

    // Draws the progress arc starting from the top.
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265359 / 2, // Start angle: -90 degrees (top of the circle)
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    // Only repaint if the progress value has changed.
    return oldDelegate.progress != progress;
  }
}