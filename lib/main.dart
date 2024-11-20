import 'package:flutter/material.dart';

/// Flutter code sample for [BottomNavigationBar].


var _navigationBarItem = [
  // {
  //   'icon': 'Icons.home',
  //   'label': 'Home',
  //   'page': 'Home',
  // },
  {
    'icon': 'Icons.business',
    'label': 'Business',
    'page': 'Business',
  },
  {
    'icon': 'Icons.school',
    'label': 'School',
    'page': 'School',
  },
  {
    'icon': 'Icons.schedule',
    'label': 'Schedule',
    'page': 'Schedule',
  },
];
Widget _convertToIconData(String? icon) {
  switch (icon) {
    case 'Icons.home':
      return const Icon(Icons.home);
    case 'Icons.business':
      return const Icon(Icons.business);
    case 'Icons.school':
      return const Icon(Icons.school);
    case 'Icons.schedule':
      return const Icon(Icons.schedule);
    default:
      return const Icon(Icons.home);
  }
}
List<BottomNavigationBarItem> _bottomNavigationBarItems = _navigationBarItem
    .map((item) => BottomNavigationBarItem(
          icon: _convertToIconData(item['icon']),
          label: item['label'],
        ))
    .toList();

List<Widget> _widgetOptions = _navigationBarItem
    .map((item) => Text(
          'Index ${_navigationBarItem.indexOf(item)}: ${item['page']}',
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ))
    .toList();
void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarExample(),
    );
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavigationBar Sample'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavigationBarItems,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
