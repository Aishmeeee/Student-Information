import 'package:flutter/material.dart';
import 'student_list.dart';

class StudentForm extends StatefulWidget {
  @override
  _StudentFormState createState() => _StudentFormState();
}

class _StudentFormState extends State<StudentForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  List<Map<String, String>> _students = [];

  void _addStudent() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _students.add({
          'name': _nameController.text,
          'age': _ageController.text,
        });
      });
      _nameController.clear();
      _ageController.clear();
    }
  }

  void _goToListScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentList(students: _students),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Student')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                value!.isEmpty ? 'Please enter a name' : null,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                value!.isEmpty ? 'Please enter an age' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _addStudent,
                child: Text('Add Student'),
              ),
              ElevatedButton(
                onPressed: _goToListScreen,
                child: Text('View Students'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
