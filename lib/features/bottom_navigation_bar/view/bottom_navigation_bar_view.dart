import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../tasks_screen/tasks_screen.dart';

void main() {
  runApp(IchiApp());
}

class IchiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ichi',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: 'Heebo',
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    TasksScreen(),
    Center(child: Text('תחביבים', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))), // Hobbies
    Center(child: Text('עמותות', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))), // Charities
    Center(child: Text('פרופיל', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))), // Profile
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.assignment, size: 30, color: Colors.white), // Tasks
          Icon(Icons.directions_run, size: 30, color: Colors.white), // Hobbies
          Icon(Icons.favorite, size: 30, color: Colors.white), // Charities
          Icon(Icons.person, size: 30, color: Colors.white), // Profile
        ],
        color: Color(0xFF662D91),
        buttonBackgroundColor: Color(0xFF662D91),
        backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}

class TasksScreen1 extends StatefulWidget {
  @override
  _TasksScreen1State createState() => _TasksScreen1State();
}

class _TasksScreen1State extends State<TasksScreen1> {
  List<Map<String, dynamic>> tasks = [];
  String selectedLevel = '';
  List<String> availableTasks = [];
  DateTimeRange? hideTaskDateRange;

  void _showTaskOptions() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('בחר רמה', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), // Select level
            ListTile(
              title: Text('Silver - 5 Points'),
              onTap: () {
                setState(() {
                  selectedLevel = 'Silver';
                  availableTasks = ['Silver Task 1', 'Silver Task 2', 'Silver Task 3'];
                });
                Navigator.pop(context);
                _showAvailableTasks();
              },
            ),
            ListTile(
              title: Text('Gold - 10 Points'),
              onTap: () {
                setState(() {
                  selectedLevel = 'Gold';
                  availableTasks = ['Gold Task 1', 'Gold Task 2', 'Gold Task 3'];
                });
                Navigator.pop(context);
                _showAvailableTasks();
              },
            ),
            ListTile(
              title: Text('Diamond - 20 Points'),
              onTap: () {
                setState(() {
                  selectedLevel = 'Diamond';
                  availableTasks = ['Diamond Task 1', 'Diamond Task 2', 'Diamond Task 3'];
                });
                Navigator.pop(context);
                _showAvailableTasks();
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showAvailableTasks() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: availableTasks.map((task) {
            return ListTile(
              title: Text(task),
              trailing: IconButton(
                icon: Icon(Icons.visibility_off),
                onPressed: () => _hideTask(task),
              ),
              onTap: () {
                setState(() {
                  tasks.add({
                    'task': task,
                    'level': selectedLevel,
                    'date': DateTime.now(),
                    'status': 'Pending',
                  });
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }

  void _hideTask(String task) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      helpText: 'בחר את טווח התאריכים', // Select date range
    );
    if (picked != null) {
      setState(() {
        hideTaskDateRange = picked;
      });
    }
  }

  void _markTaskAsCompleted(int index, bool completed) {
    setState(() {
      tasks[index]['status'] = completed ? 'Completed' : 'Failed';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('משימות'), // Tasks
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  final task = tasks[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(task['task']),
                      subtitle: Text('רמה: ${task['level']} - תאריך: ${DateFormat('dd/MM/yyyy').format(task['date'])}'), // Level and Date
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.check),
                            color: task['status'] == 'Completed' ? Colors.green : Colors.grey,
                            onPressed: () => _markTaskAsCompleted(index, true),
                          ),
                          IconButton(
                            icon: Icon(Icons.close),
                            color: task['status'] == 'Failed' ? Colors.red : Colors.grey,
                            onPressed: () => _markTaskAsCompleted(index, false),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _showTaskOptions,
              child: Text('צור משימה'), // Create Task
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF662D91),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
