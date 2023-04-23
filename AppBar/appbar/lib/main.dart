import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter додаток з appBar та bottomNavigationBar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Containers'),
        ),
        body: Container(
          color: Colors.grey,
          child: Center(
            child: Text(
              'Деякий текст...',
              style: TextStyle(
                fontSize: 24.0,
                color: Colors.white,
                decoration: TextDecoration.none,
                background: Paint()..color = Colors.yellow,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Головна',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Пошук',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Профіль',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          onTap: (int index) {},
        ),
      ),
    );
  }
}
