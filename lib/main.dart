import 'package:flutter/material.dart';
import 'dart:io' show Platform;
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var scPhysicalSize = window.physicalSize;
  int _selectedIndex = 0;

  /* 各ページのUI */
  List pages = [
    // Home
    <Widget>[
      const Text(
        'Hello World from Flutter!!',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
      ),
      Text(
        'Operation System:' + Platform.operatingSystem,
      ),
      Text(
        'OS Version:' + Platform.operatingSystemVersion,
      ),
      Text('Screen Width:' + scPhysicalSize.width.toString()),
      Text(
        'Screen Height:' + scPhysicalSize.height.toString(),
      ),
    ],
    // Modules
    <Widget>[
      const Text(
        "Modules",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
      ),
      const Text("Tab Test. Index:1")
    ],
    // Settings
    <Widget>[
      const Text(
        "Settings",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 25, color: Colors.red),
      ),
      const Text("Tab Test. Index:2")
    ],
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CoreNion's Flutter Demo"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: pages[_selectedIndex],
      )),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.devices),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cable),
            label: 'Modules',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5_sharp),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
