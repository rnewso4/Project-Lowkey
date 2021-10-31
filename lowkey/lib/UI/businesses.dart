import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Business extends StatefulWidget{
    static var _logo = '';
    static var _name = '';
    static var _description = '';
    final _newsTitle = 'How Ed Orgeron built championship …';
    final _newsDescription = 'Max Johnson had just taken a knee, pumped his fist and secured a thrilling win over Florida …';

Business(String name, String description, String logo, {Key? key}) : super(key: key) {
  _logo = logo;
  _name = name;
  _description = description;
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
        children: [
          Align(
            alignment: const Alignment(-0.9, -0.8),
            child: Text(Business._name, 
              style: const TextStyle(
                fontSize: 25,
                fontFamily: 'arial',
                color: Colors.black,
              )
            )
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Colors.white, Color(0x00aca881)],
              )
            )
          ),
          Align(
            alignment: const Alignment(-0.8, -0.6),
            child: SizedBox(
              height: 100, 
              child: Center(
                child: Image(
                  image: AssetImage(Business._logo),
                ),
              ) 
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
        ],)
    );
  }
}