import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Map<String, dynamic>> _cards = [
    {
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/thumb/c/ce/%D0%9B%D1%8C%D0%B2%D1%96%D0%B2%D1%81%D1%8C%D0%BA%D0%B0_%D0%BF%D0%BE%D0%BB%D1%96%D1%82%D0%B5%D1%85%D0%BD%D1%96%D0%BA%D0%B0_1.jpg/411px-%D0%9B%D1%8C%D0%B2%D1%96%D0%B2%D1%81%D1%8C%D0%BA%D0%B0_%D0%BF%D0%BE%D0%BB%D1%96%D1%82%D0%B5%D1%85%D0%BD%D1%96%D0%BA%D0%B0_1.jpg",
      "description":
          "Націона́льний університе́т «Льві́вська політе́хніка» — технічний заклад вищої освіти України та Східної Європи, заснований у 1816 році як Реальна школа з дозволу австрійського імператора Франца І. За результатами експертного рейтингу Львівська політехніка впродовж останніх років входить у чільну п'ятірку найкращих вітчизняних вищих навчальних закладів."
    },
    {
      "image":
          "https://www.uzhnu.edu.ua/uploads/news/20171227_1028_1742_korpus.jpg",
      "description":
          "Ужгородський національний університет заснований 18 жовтня 1945 року. Він належить до класичних університетів України, сертифікованих/затверджених за IV (вищим) рівнем акредитації (ліцензія Міністерства освіти України серії АГ №582508)."
    },
    {
      "image":
          "https://pnu.edu.ua/wp-content/uploads/2019/07/0027-1024x633.jpg",
      "description":
          "Прикарпатський національний університет імені Василя Стефаника є одним з найстаріших вищих навчальних закладів Івано-Франківської області. За роки свого існування, навчальний заклад підготував велику кількість фахівців, які працюють у державних адміністраціях, виборчих органах, науки, культури й освіти України."
    },
    {
      "image": "https://d1.ua/wp-content/uploads/2021/07/2021-07-05_171933.jpg",
      "description":
          "Дніпровський національний університет імені Олеся Гончара — один із провідних закладів вищої освіти в Україні четвертого рівня акредитації з правом підготовки іноземців за акредитованими напрямами й спеціальностями.",
    }
  ];

  void _nextCard() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _cards.length;
    });
  }

  void _prevCard() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + _cards.length) % _cards.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ModuleWork',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          centerTitle: true,
          title: Text("My Stateful Widget"),
        ),
        body: Container(
          color: Colors.blue,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                    color: Colors.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: SizedBox(
                      height: 450,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 20.0),
                          Image.network(
                            _cards[_currentIndex]["image"],
                            height: 200.0,
                            width: 200.0,
                          ),
                          Text(
                            _cards[_currentIndex]["description"],
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _prevCard,
                      child: Text("Previous university"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: _nextCard,
                      child: Text("Next university"),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
