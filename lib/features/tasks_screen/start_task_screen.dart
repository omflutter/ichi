import 'package:flutter/material.dart';
import 'dart:math';

class NewTaskScreen extends StatefulWidget {
  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  String _selectedLevel = 'כסף'; // Default task level is Silver
  List<String> _taskLevels = ['כסף', 'זהב', 'יהלום']; // Task levels

  List<Task> _randomTasks = [];

  @override
  void initState() {
    super.initState();
    _generateRandomTasks();
  }

  void _generateRandomTasks() {
    _randomTasks.clear();
    List<Task> availableTasks = _tasks.where((task) => task.level == _selectedLevel).toList();
    if (availableTasks.length >= 3) {
      List<int> indexes = [];
      while (indexes.length < 3) {
        int randomIndex = Random().nextInt(availableTasks.length);
        if (!indexes.contains(randomIndex)) {
          indexes.add(randomIndex);
          _randomTasks.add(availableTasks[randomIndex]);
        }
      }
    } else {
      _randomTasks.addAll(availableTasks);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('משימה חדשה'), // New Task
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'בחר רמת משימה', // Choose Task Level
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF662D91), // Purple color
              ),
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl, // Right-to-left direction
            ),
            SizedBox(height: 20),
            DropdownButtonFormField<String>(
              value: _selectedLevel,
              onChanged: (value) {
                setState(() {
                  _selectedLevel = value!;
                  _generateRandomTasks();
                });
              },
              items: _taskLevels.map((level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'רמת משימה', // Task Level
                labelStyle: TextStyle(
                  color: Color(0xFF662D91), // Purple color
                ),
              ),
            ),
            SizedBox(height: 20),
            if (_randomTasks.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'בחר משימה', // Choose Task
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF662D91), // Purple color
                    ),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl, // Right-to-left direction
                  ),
                  SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: _randomTasks.length,
                    itemBuilder: (context, index) {
                      final task = _randomTasks[index];
                      return Card(
                        elevation: 5,
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          title: Text(task.title),
                          subtitle: Text(task.description),
                          onTap: () {
                            _showTaskDetailsDialog(task);
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  void _showTaskDetailsDialog(Task task) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(task.title), // Task Title
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.description), // Task Description
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Implement start task logic here
                  Navigator.of(context).pop();
                  // Navigate to task screen or implement task start functionality
                },
                child: Text('התחל משימה'), // Start Task
              ),
            ],
          ),
        );
      },
    );
  }
}

class Task {
  final String title;
  final String description;
  final String level;

  Task({
    required this.title,
    required this.description,
    required this.level,
  });
}

// Dummy data for tasks
List<Task> _tasks = [
  // Silver tasks
  Task(
    title: 'תרומה לבית חולים מקומי',
    description: 'תרומה שלך יכולה לשפר את החיים של אנשים בקהילה.',
    level: 'כסף',
  ),
  Task(
    title: 'עזרה בקניית מצרכים לקראות',
    description: 'עזרו לקשישים בקניית המצרכים שלהם.',
    level: 'כסף',
  ),
  Task(
    title: 'תמיכה במסעדה חברתית',
    description: 'עזרו למסעדה חברתית בהפעלת קמפיין תמיכה כלפי אנשים זקוקים.',
    level: 'כסף',
  ),
  // Gold tasks
  Task(
    title: 'סיוע בארגון אירוע תרבותי',
    description: 'עזרו באיסוף תרומות וארגון האירוע עבור קהילה מקומית.',
    level: 'זהב',
  ),
  Task(
    title: 'ליווי תלמידים בחוג ספורט',
    description: 'עזרו בליווי תלמידים בחוג ספורט כדי לקדם פעילות גופנית וקהילתית.',
    level: 'זהב',
  ),
  Task(
    title: 'קידום מיזמים חברתיים',
    description: 'השקעת זמן ומשאבים בקידום מיזמים חברתיים והפעלתם בקהילה.',
    level: 'זהב',
  ),
  // Diamond tasks
  Task(
    title: 'טיפול בבעלי חיים חולים',
    description: 'השקעת זמן בטיפול וטיפוח בבעלי חיים חולים במוסדות מיוחדים.',
    level: 'יהלום',
  ),
  Task(
    title: 'הדרכה של נוער במידע אקולוגי',
    description: 'השקעת זמן בהדרכת נוער וצעירים לנושאים אקולוגיים ושמירה על סביבה.',
    level: 'יהלום',
  ),
  Task(
    title: 'ליווי אנשים עם מוגבלויות בפעילות ספורט',
    description: 'השקעת זמן ומשאבים בליווי אנשים עם מוגבלויות בפעילות ספורט וריפוי גופני.',
    level: 'יהלום',
  ),
];
