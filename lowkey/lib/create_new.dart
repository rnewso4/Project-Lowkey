import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage_list.dart';
import 'package:flutter/cupertino.dart';

var index = 3;

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);
  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  updateColor(int num) {
    setState(() { index = num; });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
        child: Column(
          children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios)),
              const Text(
                'Pick a category for your deal',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'helvetica',
                  color: Colors.black,
                )
              ),
            ],
          ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) { 
                    return GestureDetector(
                      onTap: () => updateColor(index),
                      child: categories(index)
                    );
                    }
                  ),
              ),
          Column(
            children: <Widget>[
            Container(
              height: 100,
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60)),
                  labelText: 'Title',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Container(
              height: 100,
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Enter start date',
                    hintText: 'MM/DD/YYYY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60),
                    )),
                maxLength: 10,
                keyboardType: TextInputType.datetime,
              ),
            ),
            Container(
              height: 100,
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: 'Enter expiration date',
                    hintText: 'MM/DD/YYYY',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60),
                    )),
                maxLength: 10,
                keyboardType: TextInputType.datetime,
              ),
            ),
            Container(
              height: 200,
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60)),
                  labelText: 'Description',
                ),
                maxLength: 150,
                maxLines: null,
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
                //margin: const EdgeInsets.only(top: 30),
                height: 40,
                width: 125,
                decoration: BoxDecoration(
                  color: _color[index],
                  borderRadius: const BorderRadius.all(Radius.circular(30))),
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
          ]),
        ]
            ),
      ),
    );
  }
}

List<Color> _color = [
  const Color(0xff794016),
  const Color(0xffE6B781),
  const Color(0xffD04545),
  const Color(0xff000000)
  ];

categories(int index) {
  List categories = <String>['Coffee', 'Bar', 'Pizza'];
  List icons = <IconData>[Icons.coffee, Icons.local_drink, Icons.local_pizza];
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(right: 30, left: (index == 0) ? 30 : 0),
      height: 80,
      width: 95,
      decoration: BoxDecoration(
        color: _color[index],
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icons[index],
            size: 40,
            color: Colors.white,
          ),
          Text(
            categories[index],
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'helvetica',
              color: Colors.white,
            ),
          ),
        ]
      )
    )
  );
}