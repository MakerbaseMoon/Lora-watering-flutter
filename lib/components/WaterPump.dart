import 'package:flutter/material.dart';
import 'package:flutter_app_test/Widget/TextButton.dart'; 
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

class WaterPump extends StatelessWidget {
  const WaterPump({super.key});
  final String host  = '';  // esp32 ip 
  
  //get
  Future<void> sendWaterRequest() async {
    final logger = Logger('name');
    const String dataGrow = 'grow';
    const String link1      = '/grow';
    final response = await http.get(
      Uri.parse('http://$host$link1?data=$dataGrow')
    );
    if (response.statusCode == 200) {
      final data = response.body;
      print('data: $data');
    } else {
      print('Request failed: ${response.statusCode}');
    }
  }

  Future<void> sendMotorRequest() async {
    const String dataToSend = 'motor';
    const String link2      = '/motor';

    final response = await http.get(
      Uri.parse('$host$link2?data=$dataToSend')
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
          padding: EdgeInsets.all(16.0),
          child: Container(
            alignment: Alignment.center,
            child: buildTextButton('馬達', const Color.fromARGB(255, 86, 114, 240), () { sendMotorRequest();}, icon: const Icon(Icons.cake_rounded)),
          )
        )
      ],
    );
  }
}
