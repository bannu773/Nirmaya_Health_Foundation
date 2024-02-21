import 'package:flutter/material.dart';
import 'package:gdsc/child.dart';

class GetDetailsChild extends StatefulWidget {
  final Function(Child) onDetailsSubmitted;

  GetDetailsChild({required this.onDetailsSubmitted});

  @override
  _GetDetailsChildState createState() => _GetDetailsChildState();
}

class _GetDetailsChildState extends State<GetDetailsChild> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController healthHistoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Child Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextFormField(
                controller: ageController,
                decoration: InputDecoration(labelText: 'Age'),
              ),
              TextFormField(
                controller: genderController,
                decoration: InputDecoration(labelText: 'Gender'),
              ),
              TextFormField(
                controller: weightController,
                decoration: InputDecoration(labelText: 'Weight'),
              ),
              TextFormField(
                controller: heightController,
                decoration: InputDecoration(labelText: 'Height'),
              ),
              TextFormField(
                controller: healthHistoryController,
                decoration: InputDecoration(labelText: 'Health History'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  widget.onDetailsSubmitted(Child(
                    name: nameController.text,
                    age: ageController.text,
                    gender: genderController.text,
                    weight: weightController.text,
                    height: heightController.text,
                    healthHistory: healthHistoryController.text,
                  ));
                  Navigator.pop(context);
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
