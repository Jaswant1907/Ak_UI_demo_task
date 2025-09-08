import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodaysProgressWidget extends StatelessWidget {
  final double progress;
  final String milesLeft;
  final String badgeText;
  
  const TodaysProgressWidget({
    Key? key,
    required this.progress,
    required this.milesLeft,
    required this.badgeText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.black.withOpacity(0.9),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Today's Progress",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildHexagonBadge(),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            milesLeft,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          _buildWalkingProgressBar(),
        ],
      ),
    );
  }

  Widget _buildHexagonBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        badgeText,
        style: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildWalkingProgressBar() {
    return Container(
      height: 30,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final containerWidth = constraints.maxWidth;
          final iconWidth = 24.0; 
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Background line
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              
              FractionallySizedBox(
                widthFactor: progress.clamp(0.0, 0.5), 
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),

              
              Positioned(
                left: (containerWidth * progress.clamp(0.0, 0.5)) - (iconWidth / 2),
                child: SvgPicture.asset('assets/images/Vector1.svg', width: iconWidth),
              ),
            ],
          );
        },
      ),
    );
  }
}
