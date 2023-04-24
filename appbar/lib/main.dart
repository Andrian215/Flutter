import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter додаток з appBar та bottomNavigationBar',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Заголовок'),
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.grey,
              child: Center(
                child: Text(
                  'Центральний текст',
                  style: TextStyle(
                    fontSize: 24.0,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    background: Paint()..color = Colors.blue,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcROpZpU7Pk68RHYRAASv9h503jU25mfTXuvyQ&usqp=CAU',
                      width: 100,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Любов',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'почуття глибокої сердечної прихильності, \n що охоплює низку сильних і позитивних \n емоційних і психічних станів',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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
          onTap: (int index) {
          },
        ),
      ),
    );
  }
}


