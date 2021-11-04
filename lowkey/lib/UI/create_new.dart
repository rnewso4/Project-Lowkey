import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lowkey/UI/homepage_list.dart';
import 'package:lowkey/flutter_fire.dart';
import '../flutter_fire.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);
  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        InkWell(
          borderRadius: BorderRadius.circular(5),
          child: const Align(
            alignment: Alignment(-0.9, -0.8),
            child: Icon(Icons.arrow_back),
          ),
          onTap: () => Navigator.pop(context),
        ),
        const Align(
          alignment: Alignment(0.0, -0.8),
          child: Text(
            'Pick a category for your deal',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'helvetica',
              color: Colors.black,
            )
          ),
        ),
        Positioned(
          top: 150,
          left: 40,
          child: Row(children: <Widget> [
            InkWell(
              child: Container(
                height: 80,
                width: 95,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color> [
                      Colors.brown,
                      Colors.brown,
                    ]
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget> [
                    Icon(
                      Icons.coffee,
                      size: 40, 
                      color: Colors.white,
                    ),
                    Text(
                      'Coffee',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: 'helvetica',
                        color: Colors.white,
                      ),
                    ),
                  ])
              )),
          ],),
        ),
        Positioned(
          top: 300,
          left: 40,
          child: Column(children: <Widget>[
            Container(
              height: 100,
              width: 300,
              margin: const EdgeInsets.all(10),
              child: const TextField(
                decoration: InputDecoration(
                  border:
                    OutlineInputBorder(borderSide: BorderSide(width: 60)),
                      labelText: 'Title',
                    ),
                    keyboardType: TextInputType.text,
                ),
              ),
              Container(
                height: 100,
                width: 300,
                margin: const EdgeInsets.all(10),
                child: const TextField(
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 100)),
                    labelText: 'Select Date',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Container(
                height: 100,
                width: 300,
                margin: const EdgeInsets.all(10),
                child: const TextField(
                  decoration: InputDecoration(
                    border:
                        OutlineInputBorder(borderSide: BorderSide(width: 60)),
                    labelText: 'Description',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomepageList()) //change to whatever page its supposed to go to
                    ),
                child: Container(
                  margin: const EdgeInsets.only(top: 30),
                  height: 40,
                  width: 100,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Color(0xFFB71C1C),
                            Color(0xFFB71C1C),
                          ]),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: const Center(
                    child: Text(
                      'Post',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  flutter_fire().uploadString();
                },
                child: const Text('Ping db'),
              )
            ]
            ),
          ),
          ] //children
          ),
    );
  }
}
