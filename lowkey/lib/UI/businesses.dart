import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Business extends StatefulWidget{
    static var _logo = '';
    static var _name = '';
    static var _description = '';
    var _svg = "";
    final _date = 'Oct 18, 2021';
    final _newsTitle = 'How Ed Orgeron built championship …';
    final _newsDescription = 'Max Johnson had just taken a knee, pumped his fist and secured a thrilling win over Florida …';

//random comment
Business(String name, String description, String logo, {Key? key}) : super(key: key) {
  _logo = logo;
  _name = name;
  _description = description;
  setSVGImage();

}

  void setSVGImage() {
    if (_name == 'Highland Coffee') {
      _svg = 'lib/UI/assets/coffee.png';
    }
    else if (_name == 'The Revelry') {
      _svg = 'lib/UI/assets/fizz.png';
    }
    else if (_name == 'Reginelli’s Pizzeria') {
      _svg = 'lib/UI/assets/pizza.png';
    }
    else {
      _svg = 'lib/UI/assets/coffee.png';
    }
  }

  String getSVGImage() {
    return _svg;
  }

  String getDate() {
    return _date;
  }

  String getNewsTitle() {
    return _newsTitle;
  }

  String getNewsDescription() {
    return _newsDescription;
  }

  String getLogo() {
    return _logo;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }

  @override
  _BusinessState createState() => _BusinessState();
}

class _BusinessState extends State<Business> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget> [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color> [
                  Colors.white,
                  Color(0xFFFFE082),
                ],
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.9, -0.8),
            child: Text(Business._name,
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'arial',
                color: Colors.black,
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-0.8, -0.6),
            child: Container(
              height: 100, 
              child: Center(
                child: Image(
                  image: AssetImage(Business._logo),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 250.0,
              left: 70.0,
              right: 70.0,
              bottom: 20.0,
            ),
            child: Text(
              Business._description,
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'arial',
              ),
            ),
          ),
          Positioned(
            top: 325,
            left: 50,
            child: Row(
              children: <Widget> [
                Column(children: const <Widget> [
                  InkWell(
                    //ignore: todo
                    //TODO: take to google maps with address
                    child: Icon(Icons.pin_drop),
                  ),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'arial',
                    )
                  )
                ]),
                const SizedBox(width: 40),
                Column(children: const <Widget>[
                  InkWell(
                    //ignore: todo
                    //TODO: get menu for business
                    child: Icon(Icons.menu_book),
                  ),
                  Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'arial',
                    ),
                  ),
                ],),
                const SizedBox(width: 40),
                Column(children: const <Widget> [
                  Text(
                    'Reviews',
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: 'arial',
                    )
                  ),
                ],),
                const SizedBox(width: 40),
                InkWell(
                  //onTap: () {
                  //ignore: todo
                  //TODO: set boolean subscribed = true
                  //}
                  child: Container(
                    height: 25,
                    width: 70,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color> [
                          Colors.deepOrangeAccent,
                          Colors.brown,
                        ]
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: const Center(
                      child: Text(
                        'Follow',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    )
                  )
                )
              ]
            )
          ),
          const Positioned(
            top: 400,
            left: 30,
            child: Text(
              'Deals',
              style: TextStyle(
                fontSize: 25,
                fontFamily: 'arial',
                fontWeight: FontWeight.bold,
              ),
            )
          ),
        ]
      )
    );
  }
}