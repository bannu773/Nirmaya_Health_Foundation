import 'package:flutter/material.dart';
import 'package:gdsc/child.dart';

class ChildDetails extends StatelessWidget {
  final List<Child> children;

  ChildDetails({required this.children});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Children Details'),
      ),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(children[index].name),
            subtitle: Text(
                'Age: ${children[index].age}, Gender: ${children[index].gender}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ChildDetailsPage(child: children[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChildDetailsPage extends StatelessWidget {
  final Child child;

  ChildDetailsPage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Child Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${child.name}'),
            Text('Age: ${child.age}'),
            Text('Gender: ${child.gender}'),
            Text('Weight: ${child.weight}'),
            Text('Height: ${child.height}'),
            Text('Health History: ${child.healthHistory}'),
          ],
        ),
      ),
    );
  }
}
