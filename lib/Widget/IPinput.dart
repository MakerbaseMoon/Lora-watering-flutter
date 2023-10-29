import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IPSaveButton extends StatefulWidget {
  @override
  _IPSaveButtonState createState() => 
    _IPSaveButtonState();
}

class _IPSaveButtonState extends State<IPSaveButton> {
  final TextEditingController _textInputIP = TextEditingController();
  final String _preferenceKey = 'IPInput';
  
  @override 
  void initState() {
    super.initState();
    _loadIPInput();
  }

  Future<void> _loadIPInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? IPInput = prefs.getString(_preferenceKey);
    if (IPInput != null) {
      _textInputIP.text = IPInput;
      final String IP =  IPInput;
    }
  }

  Future<void> _saveIPInput() async {
    String IPInput = _textInputIP.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await prefs.setString(_preferenceKey, IPInput);
    print('IPInput:$IPInput');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width:200,
            child:TextField(
              controller: _textInputIP,
              decoration: InputDecoration(labelText: 'Enter an IP address'),
            ),
          ),
          SizedBox(
            width: 100,
            child:ElevatedButton(
              onPressed: () {
                _saveIPInput();
              },
              child: const Text('Save IP'),
            )
          )
        ],
      ),
    );
  }
}