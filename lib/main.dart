import 'package:flutter/material.dart';
import 'package:gdsc/child_details.dart';
import 'package:gdsc/child_status.dart';
import 'package:gdsc/comp/ProfileScreen.dart';
import 'package:gdsc/comp/SearchScreen.dart';
import 'package:gdsc/getchilddetails.dart';
import 'package:gdsc/child.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Niramaya Health Foundation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Child> children = [];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage()));
          break;
        case 1:
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SearchScreen()));
          break;
        case 2:
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ProfileScreen()));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niramaya Health Foundation'),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 20.0,
          ),
          itemCount: 4, // Adjust the itemCount according to the number of tiles
          itemBuilder: (BuildContext context, int index) {
            return buildGridItem(index);
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildGridItem(int index) {
    switch (index) {
      case 0:
        return GridItem(
          title: 'Add Child Details',
          icon: Icons.add,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetDetailsChild(
                  onDetailsSubmitted: (child) {
                    setState(() {
                      children.add(child);
                    });
                  },
                ),
              ),
            );
          },
        );
      case 1:
        return GridItem(
          title: 'View Children Details',
          icon: Icons.person,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChildDetails(children: children),
              ),
            );
          },
        );
      case 2:
        return GridItem(
          title: 'Filter Children by Health Status',
          icon: Icons.healing,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChildStatus(children: children),
              ),
            );
          },
        );
      case 3:
        return GridItem(
          title: 'Export Data',
          icon: Icons.import_export,
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Export Data'),
                  content: Text('Select an option to export data:'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        // Placeholder for exporting data
                        print('Exporting data...');
                        Navigator.pop(context);
                      },
                      child: Text('Export as CSV'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Placeholder for exporting data
                        print('Exporting data...');
                        Navigator.pop(context);
                      },
                      child: Text('Export as PDF'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Placeholder for exporting data
                        print('Exporting data...');
                        Navigator.pop(context);
                      },
                      child: Text('Export as JSON'),
                    ),
                  ],
                );
              },
            );
          },
        );
    }
    return SizedBox.shrink();
  }
}

class GridItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  const GridItem(
      {Key? key, required this.title, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 0, 132, 255),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
