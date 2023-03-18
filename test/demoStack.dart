import 'package:flutter/material.dart';

class DemoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(height: 200, width: 200, color: Colors.blue),
        Container(height: 200, width: 200, color: Colors.red)
      ],
    );
  }
}
