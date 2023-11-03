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
  
  void _loadIPInput() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? IPInput = prefs.getString(_preferenceKey);
    if (IPInput != null) {
      _textInputIP.text = IPInput;
    }
  }

  Future<void> _saveIPInput() async {
    String IPInput = _textInputIP.text;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_preferenceKey, IPInput);
    print('IPInput:$IPInput');
    
  }

  @override
  Widget build(BuildContext context) {
  return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // Adjust padding as needed
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textInputIP,
              decoration: InputDecoration(
                labelText: 'Enter an IP address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0), 
                ),
              ),
            ),
            const SizedBox(height: 16.0), 
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded button
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16), // Button padding
              ),
              onPressed: () {
                _saveIPInput();
              },
              child: const Text('Save IP', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}