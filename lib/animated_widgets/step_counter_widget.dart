import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:ui_task_demo/animated_widgets/dark_circular_painter.dart';

// Assume DashedCirclePainter is defined as above

class StepCounterWidget extends StatefulWidget {
  final int totalSteps;
  final int currentSteps;
  final Color progressColor;
  final Color backgroundColor;
  final bool? showIcon;
   // New property
  final bool? showDashedCircle; // New property

  const StepCounterWidget({
    super.key,
    required this.totalSteps,
    required this.currentSteps,
    this.progressColor = Colors.orange,
    this.backgroundColor = Colors.grey,
    required this.showIcon , // Default to true
    required this.showDashedCircle, // Default to true
  });

  @override
  State<StepCounterWidget> createState() => _StepCounterWidgetState();
}

class _StepCounterWidgetState extends State<StepCounterWidget> {
  @override
  Widget build(BuildContext context) {
    double progress = (widget.currentSteps / widget.totalSteps).clamp(0.0, 1.0);

    return SizedBox(
      width: 200, // Adjust size as needed
      height: 200, // Adjust size as needed
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Ring
          CircularProgressIndicator(
            value: 1.0, // Full background
            strokeWidth: 20.0,
            backgroundColor: widget.backgroundColor.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(Colors.transparent),
          ),
          
          // Progress Ring
          CircularProgressIndicator(
            value: progress,
            strokeWidth: 20.0,
            valueColor: AlwaysStoppedAnimation<Color>(widget.progressColor),
          ),
          
          // Dashed Circle - Now conditional
          if (widget.showDashedCircle == true)
            Center(
              child: CustomPaint(
                size: Size(180, 180), 
                painter: DashedCirclePainter(
                  strokeWidth: 2.0,
                  color: Colors.white,
                  numberOfDashes: 30, 
                  dashSpace: 8.0,
                ),
              ),
            ),
          
          // Content including icon and text
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Walking Icon - Now conditional
              if (widget.showIcon == true)
                SizedBox(
                  height: 50,
                  width: 50,
                  child: SvgPicture.asset('assets/images/Vector1.svg'),
                ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.currentSteps.toString(),
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Steps',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}