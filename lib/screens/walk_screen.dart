import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_demo/animated_widgets/circular_progress_intecator.dart';
import 'package:ui_task_demo/animated_widgets/dark_circular_painter.dart';
import 'package:ui_task_demo/animated_widgets/step_counter_widget.dart';
import 'package:ui_task_demo/animated_widgets/todays_progress_indicator.dart';
import 'package:ui_task_demo/animated_widgets/walking_progress_indicator.dart';


class WalkScreen extends StatelessWidget {
  const WalkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color(0xFF08070C,),
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Hello'), Text('Let\'s Start Walk')],
        ),
        actions: [Icon(Icons.more_vert)],
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 10),
            Center(child: Container(height: 219, width: 219, child: StepCounterWidget(totalSteps: 7000, currentSteps: 5412,showDashedCircle: true,showIcon: true,))),
        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( 
                mainAxisAlignment: MainAxisAlignment.spaceAround,
        
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          spacing: 5,
                          children: [
                           SvgPicture.asset('assets/images/Vector1.svg'),
                            Text('10,2',style: TextStyle(color: Colors.red),),
                            Text('miles')
                          ],
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey
                     
                    ),
                  ),
                  Container(
                     child: Center(
                       child: FittedBox(
                         child: Row(
                            spacing: 5,
                            children: [
                              
                             SvgPicture.asset('assets/images/Vector.svg'),
                              Text('2180'),
                              Text('burned')
                            ],
                          ),
                       ),
                     ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
        
                      color: Colors.grey
                    ),
                    height: 40,
                    width: 100,
                  ),
                  Container(
                     child: Center(
                       child: FittedBox(
                         child: Row(
                            spacing: 5,
                            children: [
                             SvgPicture.asset('assets/images/Vector3.svg'),
                              Text('5,5',style: TextStyle(color: Colors.red),),
                              Text('Time')
                            ],
                          ),
                       ),
                     ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
        
                     color: Colors.grey
                    ),
                    height: 40,
                    width: 100,
                  ),
                 
                ],
              ),
            ),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                           color: Colors.grey,
                      ),
                   
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Daily Goals'),
                          ),
                          Icon(Icons.arrow_right)
                        ],
                      ),
                      height: 51,
                      width: 396,
                    ),
                    
             ),
             Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(15.0),
                   color: Colors.grey,
              ),
              height: 100,
              
              
              child: FittedBox(
                child: Row(
                  spacing: 10,
                  children: [
                    Container(
                          
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        
                        children: [
                          Text('5/7',style: TextStyle(fontSize: 20),),
                        
                          Text('Completed',style: TextStyle(fontSize: 12),),
                        ],
                      ),
                    ),
                    FittedBox(
                  child: Row(
                    spacing: 5,
                    mainAxisAlignment: MainAxisAlignment.center, // center horizontally
                    children: [
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10),
                          Text('S'),
                        ],
                      ),
                      // spacing between items
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 5, strokeWidth: 10),
                          Text('M'),
                        ],
                      ),
                     
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10, strokeWidth: 10),
                          Text('T'),
                        ],
                      ),
                      
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10, strokeWidth: 10),
                          Text('w'),
                        ],
                      ),
                     
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10, strokeWidth: 10),
                          Text('T'),
                        ],
                      ),
                     
                      Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10, strokeWidth: 10),
                          Text('F'),
                        ],
                      ),
                       Column(
                        children: [
                          CircularProgressIndicatorWithNumber(progress: 10, strokeWidth: 10),
                          Text('S'),
                        ],
                      ),
                    ],
                  ),
                )
                
                  ],
                
                ),
              ),
              
             ),
             Container(
              decoration: BoxDecoration(
                color: Colors.grey
              ),
              child: TodaysProgressWidget(progress: 2, milesLeft: '13.8 miles left', badgeText: '12 M')),
             Container(
               height: 200,
              color: Colors.red,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Water Tracker'),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                    
                  ),
                 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        spacing: 20,
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            child: StepCounterWidget(currentSteps: 150,totalSteps: 500,showDashedCircle: false,showIcon: false,),
                          ),
                          Container(
                            height: 100,
                            
                            child: Column(
                              children: [
                                Text('400ml/200ml',
                                style: TextStyle(fontSize: 24,color: Colors.white),),
                                ElevatedButton(onPressed: (){}, child: Text('Drink'),)
                              ],
                            ),
                          )
                        ],
                        
                      ),
                    ),
                  )
                ],
              ),
             )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        
        items: [BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home")]),
    );
  }
}
