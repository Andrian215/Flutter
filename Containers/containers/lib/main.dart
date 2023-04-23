import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Container(
          color: Colors.blue,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 10,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                left: 20,
                top: 20,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.green,
                ),
              ),
              Positioned(
                left: 30,
                top: 30,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
