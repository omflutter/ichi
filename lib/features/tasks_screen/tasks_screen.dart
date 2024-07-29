import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ichi/features/tasks_screen/start_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Timer _timer;
  late DateTime _endTime;
  Duration _timeLeft = Duration();

  @override
  void initState() {
    super.initState();
    _endTime = DateTime.now().add(Duration(hours: 12)); // Example end time
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _timeLeft = _endTime.difference(DateTime.now());
      });
      if (_timeLeft.isNegative) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('איצ\'י - משימות'), // Ichi - Tasks
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              // Navigate to history screen
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HistoryScreen()),
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF662D91), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'כותרת משימה', // Task Title
                        style: TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF662D91), // Purple color
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl, // Right-to-left direction
                      ),
                      SizedBox(height: 20),
                      Text(
                        'תיאור המשימה: זהו תיאור המשימה הנוכחית שעליך להשלים עד סוף היום.', // Task description: This is the description of the current task you need to complete by the end of the day.
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl, // Right-to-left direction
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.grey),
                          SizedBox(width: 10),
                          Text(
                            'רמת משימה: כסף', // Task Level: Silver
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textDirection: TextDirection.rtl, // Right-to-left direction
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.monetization_on, color: Colors.yellow),
                          SizedBox(width: 10),
                          Text(
                            'מטבעות: 5', // Coins: 5
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textDirection: TextDirection.rtl, // Right-to-left direction
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.timer, color: Colors.red),
                          SizedBox(width: 10),
                          Text(
                            'נותר זמן: ${_timeLeft.inHours}:${_timeLeft.inMinutes.remainder(60)}:${_timeLeft.inSeconds.remainder(60)}', // Time Left
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textDirection: TextDirection.rtl, // Right-to-left direction
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              // Implement task completion logic
                            },
                            child: Text('השלם משימה'), // Complete Task
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF78BE1F), // Apple Green color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Implement task failure logic
                            },
                            child: Text('לא הושלם'), // Failed to Complete
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red, // Red color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement start new task logic
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => NewTaskScreen()),
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Color(0xFF662D91),
        foregroundColor: Colors.white,// Purple color
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('היסטוריית משימות'), // Task History
      ),
      body: Center(
        child: Text(
          'היסטוריית משימות', // Task History
          style: TextStyle(
            fontSize: 24.0,
            color: Color(0xFF662D91), // Purple color
            fontWeight: FontWeight.bold,
          ),
          textDirection: TextDirection.rtl, // Right-to-left direction
        ),
      ),
    );
  }
}

