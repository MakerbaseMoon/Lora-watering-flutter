import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Widget/TextButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterPump extends StatefulWidget {
  const WaterPump({Key? key}) : super(key: key);

  @override
  _WaterPumpState createState() => _WaterPumpState();
}
class _WaterPumpState extends State<WaterPump> {
  final String _preferenceKey = 'IPInput';
  String host  = '';
  
  @override
  void initState() {
    super.initState();
    _loadIP();
  }

  Future<void> _loadIP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? IPInput = prefs.getString(_preferenceKey);
    if (IPInput != null) {
      print('IPInput from WaterPump.dart: $IPInput');
      host = IPInput;
        print('host:$host');
    }
  }

  Future<void> saveIPInput(String ipAddress) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_preferenceKey, ipAddress);
    print('IPInput saved: $ipAddress');
  }
  
  //get
  Future<void> sendWaterRequest() async {
    const String link1      = '/watering';
    final response = await http.get(
      Uri.parse('http://$host$link1')
    );
    if (response.statusCode == 200) {
      final data = response.body;
      print('data: $data');
    } else {
      print('Request failed: ${response.statusCode}');
    }
  }

  Future<void> sendMotorRequest() async {
    const String link2      = '/feeding';

    final response = await http.get(
      Uri.parse('http://$host$link2')
    );
    
    if (response.statusCode == 200) {
      final data = response.body;
      print('data: $data');
    } else {
      print('Request failed: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column( 
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: buildTextButton('澆水', const Color.fromARGB(255, 86, 114, 240), () { sendWaterRequest();} ,icon: const Icon(Icons.bluetooth_drive_outlined)),
          )
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: buildTextButton('馬達', const Color.fromARGB(255, 86, 114, 240), () { sendMotorRequest();}, icon: const Icon(Icons.cake_rounded)),
          )
        )
      ],
    );
  }
}
