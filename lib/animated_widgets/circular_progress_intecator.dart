// import 'package:flutter/material.dart';

// class CircularProgressIndicatorWithNumber extends StatelessWidget {
//   final double progress; // Value from 0.0 to 1.0
//   final double strokeWidth;
//   final Color backgroundColor;
//   final Color progressColor;
//   final TextStyle textStyle;
//   final double iconSize;

//   const CircularProgressIndicatorWithNumber({
//     super.key,
//     required this.progress,
//     this.strokeWidth = 10.0,
//     this.backgroundColor = const Color(0xFF1D1F23),
//     this.progressColor = const Color(0xFFFF9D24),
//     this.textStyle = const TextStyle(
//       fontSize: 10,
//       fontWeight: FontWeight.bold,
//       color: Colors.white,
//     ),
//     this.iconSize = 24.0, // Default size for the icon
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         SizedBox(
//           width: 45,
//           height: 45,
//           child: CustomPaint(
//             painter: _CircularProgressPainter(
//               progress: progress,
//               strokeWidth: strokeWidth,
//               backgroundColor: backgroundColor,
//               progressColor: progressColor,
//             ),
//           ),
//         ),
//         // Conditional rendering for the progress number or a checkmark/cross icon
//         if (progress >= 1.0)
//           Icon(
//             Icons.close, // Using a close icon as a simple cross
//             color: Colors.white,
//             size: iconSize,
//           )
//         else
//           Text(
//             '${(progress * 100).toInt()}',
//             style: textStyle,
//           ),
//       ],
//     );
//   }
// }

// class _CircularProgressPainter extends CustomPainter {
//   final double progress;
//   final double strokeWidth;
//   final Color backgroundColor;
//   final Color progressColor;

//   _CircularProgressPainter({
//     required this.progress,
//     required this.strokeWidth,
//     required this.backgroundColor,
//     required this.progressColor,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final backgroundPaint = Paint()
//       ..color = backgroundColor
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final progressPaint = Paint()
//       ..color = progressColor
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke
//       ..strokeCap = StrokeCap.round;

//     final center = Offset(size.width / 2, size.height / 2);
//     final radius = (size.width - strokeWidth) / 2;

//     // Draw the full background circle with a solid color
//     canvas.drawCircle(center, radius, backgroundPaint);

//     // Calculate the sweep angle for the progress arc
//     final sweepAngle = 2 * 3.14159265359 * progress;

//     // Draw the progress arc
//     canvas.drawArc(
//       Rect.fromCircle(center: center, radius: radius),
//       -3.14159265359 / 2, // Start angle at the top (-90 degrees)
//       sweepAngle,
//       false,
//       progressPaint,
//     );
//   }

//   @override
//   bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
//     return oldDelegate.progress != progress ||
//            oldDelegate.backgroundColor != backgroundColor ||
//            oldDelegate.progressColor != progressColor;
//   }
// }\

import 'package:flutter/material.dart';

class CircularProgressIndicatorWithNumber extends StatelessWidget {
  final double progress; // Value from 0.0 to 1.0
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;
  final TextStyle textStyle;
  final double iconSize;

  const CircularProgressIndicatorWithNumber({
    super.key,
    required this.progress,
    this.strokeWidth = 10.0,
    this.backgroundColor = const Color(0xFF1D1F23),
    this.progressColor = const Color(0xFFFF9D24),
    this.textStyle = const TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    this.iconSize = 24.0, // Default size for the icon
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
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
        // This is the new part for the text
        if (progress >= 1.0)
          Icon(
            Icons.close, // Using a close icon as a simple cross
            color: Colors.white,
            size: iconSize,
          )
        else
          Text(
            '${(progress * 100).toInt()}',
            style: textStyle,
          ),
      ],
    );
  }
}

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
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = progressColor
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Draw the full background circle with a solid color
    canvas.drawCircle(center, radius, backgroundPaint);

    // Calculate the sweep angle for the progress arc
    final sweepAngle = 2 * 3.14159265359 * progress;

    // Draw the progress arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.14159265359 / 2, // Start angle at the top (-90 degrees)
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _CircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
           oldDelegate.backgroundColor != backgroundColor ||
           oldDelegate.progressColor != progressColor;
  }
}