import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ui_task_demo/animated_widgets/circular_progress_intecator.dart';
import 'package:ui_task_demo/animated_widgets/dark_circular_painter.dart';
import 'package:ui_task_demo/animated_widgets/step_counter_widget.dart';
import 'package:ui_task_demo/animated_widgets/todays_progress_indicator.dart';
import 'package:ui_task_demo/animated_widgets/walking_progress_indicator.dart';

class WalkScreen extends StatefulWidget {
  const WalkScreen({super.key});

  @override
  State<WalkScreen> createState() => _WalkScreenState();
}

class _WalkScreenState extends State<WalkScreen> {
  final TextStyle textStyle1 = TextStyle(color: Colors.white);
  final TextStyle textStyle2 = TextStyle(color: Colors.grey);

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF08070C),

      body: SingleChildScrollView(
        child: Column(
          spacing: 15,
          children: [
            SizedBox(height: 15),

            Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        Text('Hello,', style: textStyle1),
                        Text(
                          'Let\'s Start Walk',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(Icons.more_vert, color: Colors.white),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                height: 219,
                width: 219,
                child: StepCounterWidget(
                  totalSteps: 7000,
                  
                  currentSteps: 5412,
                  showDashedCircle: true,
                  showIcon: true,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xFF32313680),
                    ),
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset('assets/images/Vector1.svg'),
                            Text('10,2', style: TextStyle(color: Colors.white)),
                            Text('miles', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),

                      color: Color(0xFF32313680),
                    ),
                    height: 40,
                    width: 100,
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset('assets/images/Vector.svg'),
                            Text('2180', style: TextStyle(color: Colors.white)),
                            Text(
                              'burned',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),

                      color: Color(0xFF32313680),
                    ),
                    height: 40,
                    width: 100,
                    child: Center(
                      child: FittedBox(
                        child: Row(
                          spacing: 5,
                          children: [
                            SvgPicture.asset('assets/images/Vector3.svg'),
                            Text('5,5', style: TextStyle(color: Colors.white)),
                            Text('Time', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF32313680),
                ),
                height: 51,
                width: 396,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Daily Goals',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Icon(Icons.arrow_right, color: Colors.white),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
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
                          Text(
                            '5/7',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),

                          Text(
                            'Completed',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    FittedBox(
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.center,
                        // center horizontally
                        children: [
                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 2000 / 2500,
                                strokeWidth: 5,
                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('S', style: textStyle1),
                            ],
                          ),
                          // spacing between items
                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 2500 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('M', style: textStyle1),
                            ],
                          ),

                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 1700 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('T', style: textStyle1),
                            ],
                          ),

                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 0 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('w', style: textStyle1),
                            ],
                          ),

                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 2000 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('T', style: textStyle1),
                            ],
                          ),

                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 2500 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('F', style: textStyle1),
                            ],
                          ),
                          Column(
                            spacing: 5,
                            children: [
                              CircularProgressIndicator(
                                value: 2500 / 2500,
                                strokeWidth: 5,

                                backgroundColor: Colors.blue.withOpacity(0.2),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Colors.orange,
                                ),
                              ),
                              Text('S', style: textStyle1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: TodaysProgressWidget(
                progress: 2,
                milesLeft: '13.8 miles left',
                badgeText: '12 M',
              ),
            ),
            Container(
               color: Color(0xFF32313680),
              child: Column(
                spacing: 15,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Water Tracker',style: textStyle1,),
                        Spacer(),
                        Icon(Icons.more_horiz,color: Colors.white,),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      child: Row(
                        spacing: 20,
                        children: [
                          SizedBox(
                            height: 140,
                            width: 140,
                            child: StepCounterWidget(
                              currentSteps: 400,

                              
                              showIcon: false,
                             
                              totalSteps: 500,

                             
                              progressColor: Colors.blue,
                             
                              showDashedCircle: false,
                              
                            ),
                          ),
                          SizedBox(
                            height: 100,

                            child: Column(
                              children: [
                                Text(
                                  '400ml/200ml',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Drink'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FittedBox(
                    child: Row(
                      spacing: 10,
                      children: [
                       
                        FittedBox(
                          child: Row(
                            spacing: 10,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // center horizontally
                            children: [
                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 2000 / 2500,
                                    strokeWidth: 5,
                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('S', style: textStyle1),
                                ],
                              ),
                              // spacing between items
                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 2500 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('M', style: textStyle1),
                                ],
                              ),

                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 1700 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('T', style: textStyle1),
                                ],
                              ),

                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 0 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('w', style: textStyle1),
                                ],
                              ),

                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 2000 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('T', style: textStyle1),
                                ],
                              ),

                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 2500 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('F', style: textStyle1),
                                ],
                              ),
                              Column(
                                spacing: 5,
                                children: [
                                  CircularProgressIndicator(
                                    value: 2500 / 2500,
                                    strokeWidth: 5,

                                    backgroundColor: Colors.blue.withOpacity(
                                      0.2,
                                    ),
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Colors.blue,
                                        ),
                                  ),
                                  Text('S', style: textStyle1),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black, // Dark background from your screenshot
        selectedItemColor: Colors.blueAccent, // Color of the selected item
        unselectedItemColor: Colors.grey, // Color of unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '', // No label for a clean look
          ),
          BottomNavigationBarItem(icon: Icon(Icons.water_drop), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.directions_walk), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }
}
