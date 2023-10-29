import 'package:flutter/material.dart';


class TemperatureHumidity extends StatelessWidget {
  const TemperatureHumidity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '時間',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              )
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: <Widget>[
            Text(
              '溫度', 
              style: TextStyle(
                color: Colors.blue,
                fontSize:30,
              )
            ),
            Text(
              '濕度', 
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              )
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children: <Widget>[
            Text(
              '22.5', 
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              )
            ),
            Text(
              '23.5', 
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
              )
            )
          ],
        )
      ]
    );
  }
}