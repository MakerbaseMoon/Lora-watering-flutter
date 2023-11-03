import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class TemperatureHumidity extends StatefulWidget {
  const TemperatureHumidity({Key? key}) : super(key: key);
  
  @override
  _TemperatureHumidityState createState() => _TemperatureHumidityState();
}
  
class _TemperatureHumidityState extends State<TemperatureHumidity> {
  String temperature = 'Loading...';
  String humidity    = 'Loading...';
  String rssi        = 'Loading...';
  String timestamp   = 'Loading...';
  final String _preferenceKey = 'IPInput';
  String host  = '';

  
  @override
  void initState() {
    super.initState();
    _loadIP();
    Timer.periodic(const Duration(minutes: 1), (timer) {
      // _loadIPInputFromIPInputDart();
      fetchDataTemperature();
      fetchDataHumidity();
      fetchDataTimestamp();
      fetchDataRssi();
    }); 
  }

  Future<void> _loadIP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? IPInput = prefs.getString(_preferenceKey);
    
    if (IPInput != null) {
      print('IPInput from TemperatureHumidity.dart: $IPInput');
      host = IPInput;
      print('host:$host');
    }
  }
  
  Future<void> saveIPInput(String ipAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_preferenceKey, ipAddress);
    print('IPInput saved: $ipAddress');
  }

  Future<void> fetchDataTemperature() async {
    const String temperature_link = '/temperature';
    final response = await http.get(
      Uri.parse('http://$host$temperature_link')
    );
    if (response.statusCode == 200) {
      final data = response.body; 
      if (mounted) {
        setState(() {
          temperature = data; 
        });
        print('data: $data');
        print("Temperature success");
      }
    } else {
      setState(() {
        temperature = 'Temperature Failed to load data';
      });
    }
  }

  Future<void> fetchDataHumidity() async {
    const String humidity_link = '/humidity';
    final response = await http.get(
      Uri.parse('http://$host$humidity_link')
    );

    if (response.statusCode == 200) {
      final data = response.body; 
      if (mounted) {
        setState(() {
          humidity = data;
        });
        print('data: $data');
        print("Humidity success");
      }
    } else {
      setState(() {
        humidity = 'Humidity Failed to load data';
      });
    }
  }

  Future<void> fetchDataTimestamp() async {
    const String timestamp_link = '/timestamp';
    final response = await http.get(
      Uri.parse('http://$host$timestamp_link')
    );

    if (response.statusCode == 200) {
      final data = response.body; 
      if (mounted) {
        setState(() {
          timestamp = data;
        });
        print('data: $data');
        print("Timestamp success");
      }
    } else {
      setState(() {
        timestamp = 'Timestamp Failed to load data';
      });
    }
  }

  Future<void> fetchDataRssi() async {
    const String rssi_link = '/rssi';
    final response = await http.get(
      Uri.parse('http://$host$rssi_link')
    );

    if (response.statusCode == 200) {
      final data = response.body; 
      if (mounted) {
        setState(() {
          rssi = data;
        });
        print('data: $data');
        print("Rssi success");
      }    
    } else {
      setState(() {
        rssi = 'Rssi Failed to load data';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30.0), 
        Container(
          margin: const EdgeInsets.all(25.0),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Card (
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(40.0), 
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '溫度',
                        style: TextStyle(
                          color: Color.fromARGB(255, 207, 35, 35),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$temperature °C',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 199, 37, 37),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                )
              ),
              Expanded(
                child: Card (
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(40.0), 
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '濕度',
                        style: TextStyle(
                          color: Color.fromARGB(255, 209, 58, 58),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$humidity %',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 219, 56, 56),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ),
            ],
          ), 
        ),
        const SizedBox(height: 30.0), 
        Container(
          margin: const EdgeInsets.all(25.0),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Card (
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(40.0), 
                  ),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        '時間',
                        style: TextStyle(
                          color: Color.fromARGB(255, 207, 35, 35),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$temperature ',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 199, 37, 37),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  )
                )
              ),
              Expanded(
                child: Card (
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Theme.of(context).colorScheme.outline,
                    ),
                    borderRadius: BorderRadius.circular(40.0), 
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Rssi ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 209, 58, 58),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '$rssi',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 219, 56, 56),
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              ),
            ],
          ), 
        ),
      ],
    );
  }
}