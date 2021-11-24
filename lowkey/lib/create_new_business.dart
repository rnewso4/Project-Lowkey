import 'package:flutter/material.dart';
import 'components/app_icons.dart';

final List<String> _buttonText = [
  'Add new event',
  'Add new discount',
  'Add new music',
  '',
];

class CreateNewBusiness extends StatefulWidget {
  const CreateNewBusiness({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CreateNewBusinessState();
}

class _CreateNewBusinessState extends State<CreateNewBusiness> {
  var _index = 3;

  updateColor(int num) {
    setState(() {
      _index = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Text('Select category to add to your business',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'helvetica',
                        color: Colors.black,
                      ))
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
                            child: categories(index));
                      })),
              Column(
                children: <Widget>[
                  Container(
                      height: 500,
                      width: 300,
                      margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                      child: const TextField(
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 100),
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(width: 60)),
                          labelText: 'Enter description',
                        ),
                        keyboardType: TextInputType.text,
                      )),
                  InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                          height: 60,
                          width: 150,
                          decoration: const BoxDecoration(
                              color: Color(0xff757575),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          child: Center(
                              child: Text(_buttonText[_index],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )))))
                ],
              )
            ])));
  }

  categories(int index) {
    List categories = <String>['Event', 'Deal', 'Music'];
    List icons = <IconData>[Icons.event, MyFlutterApp.dollar, MyFlutterApp.mic];

    return InkWell(
        child: Container(
            margin: EdgeInsets.only(right: 30, left: (index == 0) ? 30 : 0),
            height: 80,
            width: 95,
            decoration: const BoxDecoration(
              color: Color(0xff757575),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icons[index],
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(categories[index],
                      style: const TextStyle(
                        fontSize: 10,
                        fontFamily: 'helvetica',
                        color: Colors.white,
                      ))
                ])));
  }
}
