import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'TemperatureHumidity.dart';
import 'WaterPump.dart';
import '../Widget/IPinput.dart';

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
        title: const Text('RoRa Feeding', style: TextStyle(fontSize: 30)),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'), 
            fit: BoxFit.cover, 
          ), // 
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              IPSaveButton(),
              _widgetOptions.elementAt(_selectedIndex),
            ],
          ),
        ),
      ),
      
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dew_point, size: _selectedIndex == 0 ? 60 : 50, color: _selectedIndex == 0 ? const Color.fromARGB(255, 5, 48, 83):const Color.fromARGB(255, 202, 240, 255)),
            label: '溫溼度',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gas_meter, size: _selectedIndex == 1 ? 60 : 50, color: _selectedIndex == 1 ? const Color.fromARGB(255, 5, 48, 83):const Color.fromARGB(255, 202, 240, 255)),
            label: '抽水馬達',
            backgroundColor: Colors.green,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor:const Color.fromARGB(255, 30, 21, 146),
        backgroundColor:const Color.fromARGB(255, 61, 166, 226),
        onTap: _onItemTapped,
      ),
    );
  }

  static const TextStyle optionStyle =
    TextStyle(fontSize: 50, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    TemperatureHumidity(),
    WaterPump(),
  ];
}