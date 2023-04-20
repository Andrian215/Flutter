import 'package:flutter/material.dart';

void main() => runApp(MyAppWrapper());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class MyAppWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyApp(),
    );
  }
}

class _MyAppState extends State<MyApp> {
  bool _isSwitched = false;
  Color _backgroundColor = Colors.white;
  double _age = 0;
  String _selectedCity = 'Київ';
  String _name = '';

  List<String> _cities = [
    'Київ',
    'Харків',
    'Одеса',
    'Дніпро',
    'Львів',
    'Кривий Ріг',
    'Ужгород',
  ];

  void _showUserInfo() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Користувач'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ваше ім\'я: $_name'),
            SizedBox(height: 8),
            Text('Ваш вік: $_age'),
            SizedBox(height: 8),
            Text('Ви народились в: $_selectedCity'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Align(
              alignment: Alignment.topRight,
              child: Switch(
                value: _isSwitched,
                onChanged: (value) {
                  setState(() {
                    _isSwitched = value;
                    _backgroundColor = _isSwitched ? Colors.grey : Colors.white;
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Введіть своє ім\'я',
                ),
                onChanged: (value) {
                  setState(() {
                    _name = value;
                  });
                },
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Вік: $_age'),
                  Expanded(
                    child: Slider(
                      value: _age,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      onChanged: (value) {
                        setState(() {
                          _age = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Місто народження: '),
                  DropdownButton(
                    value: _selectedCity,
                    onChanged: (value) {
                      setState(() {
                        _selectedCity = value.toString();
                      });
                    },
                    items: _cities.map((String city) {
                      return DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: ElevatedButton(
                onPressed: _showUserInfo,
                child: Text('Показати інформацію'),
              ),
            ),
          ],
        ),
        backgroundColor: _backgroundColor,
      ),
    );
  }
}
