import 'package:flutter/material.dart';

class Student {
  String name;
  double? gpa;
  int year;

  Student(this.name, this.gpa, this.year);

  Student.unknown() : name = 'Unknown', gpa = null, year = 1;

  String status() {
    return gpa != null ? 'GPA: $gpa' : 'GPA: not available';
  }
}

Map<String, int> optimization(List<int> num) {
  if (num.isEmpty) {
    return {'Sum': 0, 'Min': 0, 'Max': 0};
  }
  int sum = num.reduce((a, b) => a + b);
  int max = num.reduce((a, b) => a > b ? a : b);
  int min = num.reduce((a, b) => a < b ? a : b);
  return {'Sum': sum, 'Min': min, 'Max': max};
}

// Exercise 3: Async function to fetch grades
Future<List<int>> fetchGrades() async {
  // Simulate a 2-second network delay
  await Future.delayed(Duration(seconds: 2));
  // Return the list of grades
  return [85, 92, 78, 95, 88];
}

void main() async {
  var stu1 = Student('Nairith Rin', 4.0, 4);
  var stu2 = Student.unknown();
  var stu3 = Student('Bob', null, 3);

  print('\n--- Exercise 1: Classes & Objects ---\n');
  print('${stu1.name}: ${stu1.status()} : Year ${stu1.year}');
  print('${stu2.name}: ${stu2.status()} : Year ${stu2.year}');
  print('${stu3.name}: ${stu3.status()} : Year ${stu3.year}');

  // Exercise 2: Test analyzeNumbers function
  print('\n--- Exercise 2: Collections & Functions ---\n');
  var num = [1, 2, 3, 4, 5];
  var result = optimization(num);
  print('Numbers: $num');
  print('Sum: ${result['Sum']}');
  print('Min: ${result['Min']}');
  print('Max: ${result['Max']}');

  // Exercise 3: Async Practice
  print('\n--- Exercise 3: Async Practice ---\n');
  print('Fetching grades...');
  try {
    List<int> grades = await fetchGrades();
    print('Grades: $grades');

    // Calculate average
    double average = grades.reduce((a, b) => a + b) / grades.length;
    print('Average Grade: ${average.toStringAsFixed(2)}');
  } catch (e) {
    print('Error fetching grades: $e');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab02',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const MyHomePage(title: 'Nairith Rin'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.flutter_dash, size: 80, color: Colors.blue),
            const SizedBox(height: 16), // Vertical spacing
            const Text(
              'Flutter is awesome!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Week 1 - Getting Started',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
