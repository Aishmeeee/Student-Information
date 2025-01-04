import 'package:flutter/material.dart';
import 'student_detail.dart';

class StudentList extends StatelessWidget {
  final List<Map<String, String>> students;

  StudentList({required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student List')),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index]['name']!),
            subtitle: Text('Age: ${students[index]['age']}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StudentDetail(student: students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
