import 'package:flutter/material.dart';
import 'package:gdsc/child.dart';

class ChildStatus extends StatefulWidget {
  final List<Child> children;

  ChildStatus({required this.children});

  @override
  _ChildStatusState createState() => _ChildStatusState();
}

class _ChildStatusState extends State<ChildStatus> {
  String _selectedStatus = 'Healthy';

  @override
  Widget build(BuildContext context) {
    List<Child> filteredChildren = widget.children.where((child) {
      if (_selectedStatus == 'Healthy') {
        return !child.healthHistory.contains('ill');
      } else {
        return child.healthHistory.contains('ill');
      }
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Child Status'),
      ),
      body: Column(
        children: [
          DropdownButton<String>(
            value: _selectedStatus,
            onChanged: (value) {
              setState(() {
                _selectedStatus = value!;
              });
            },
            items: <String>['Healthy', 'Unhealthy'].map((status) {
              return DropdownMenuItem<String>(
                value: status,
                child: Text(status),
              );
            }).toList(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChildren.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredChildren[index].name),
                  subtitle: Text(
                      'Age: ${filteredChildren[index].age}, Gender: ${filteredChildren[index].gender}'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ChildDetailsPage(child: filteredChildren[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
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
