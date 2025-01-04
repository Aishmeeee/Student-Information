import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final Map<String, String> student;

  StudentDetail({required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${student['name']}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Age: ${student['age']}', style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
