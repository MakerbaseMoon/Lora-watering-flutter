import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  final String host  = '';

  @override
  void initState() {
    super.initState();
    fetchDataTemperature();
    fetchDataHumidity();
    fetchDataTimestamp();
    fetchDataRssi();
    // Timer.periodic(const Duration(seconds: 10), (timer) {
    //   fetchDataTemperature();
    //   fetchDataHumidity();
    // }); 
  }

  Future<void> fetchDataTemperature() async {
    const String temperature_link = '/temperature';
    final response = await http.get(
      Uri.parse('http://$host$temperature_link')
    );
    if (response.statusCode == 200) {
      final data = response.body; 
      setState(() {
        temperature = data; 
      });
      print('data: $data');
      print("Temperature success");
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
      setState(() {
        humidity = data;
      });
      print('data: $data');
      print("Humidity success");
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
      setState(() {
        timestamp = data;
      });
      print('data: $data');
      print("Timestamp success");
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
      setState(() {
        rssi = data;
      });
      print('data: $data');
      print("Rssi success");
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
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '時間',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 25,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30.0), 
        Container(
          margin: const EdgeInsets.all(25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Card (
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
          )
        )
      ],
    );
  }
}