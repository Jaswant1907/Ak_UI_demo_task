import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WalkingProgressWidget extends StatelessWidget {
  final double progress; // Value between 0.0 and 1.0

  const WalkingProgressWidget({Key? key, required this.progress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30, // Adjust height as needed
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calculate the width of the available space for the progress bar
          // The constraints.maxWidth gives us the width of the parent (Container)
          final containerWidth = constraints.maxWidth;
          
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
          
              Container(
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

            
              FractionallySizedBox(
                widthFactor: progress,
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),


              Positioned(
                left: (containerWidth * progress) - 12,
                child: SvgPicture.asset('assets/images/Vector1.svg', width: 24),
              ),
            ],
          );
        },
      ),
    );
  }
}
