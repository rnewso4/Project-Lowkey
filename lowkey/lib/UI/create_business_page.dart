import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import '../UI/create_new.dart';

final List<Color> _color = [
  const Color(0xff794016),
  const Color(0xffE6B781),
  const Color(0xffD04545),
  const Color(0xff747474),
  const Color(0xff000000)
];

final _formKey = GlobalKey<FormState>();

class CreateBusiness extends StatefulWidget {
  const CreateBusiness({Key? key}) : super(key: key);
  @override
  _CreateBusinessState createState() => _CreateBusinessState();
}

class _CreateBusinessState extends State<CreateBusiness> {
  var _index = 4;

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
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios)),
                  const Text('Pick a category for your business',
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'helvetica',
                      color: Colors.black,
                    ))]),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => updateColor(index),
                      child: categories(index));
                  })),
              Container(
                height: 100,
                width: 300,
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60)),
                    labelText: 'Name of Business'),
                  keyboardType: TextInputType.text,
                  validator: (password) => (password == null || password.isEmpty) ? 'Text is empty' : null
                )),
              Container(
                height: 200,
                width: 300,
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(width: 60)),
                    labelText: 'Description'),
                  maxLength: 150,
                  maxLines: null,
                  keyboardType: TextInputType.text,
                  validator: (password) => (password == null || password.isEmpty) ? 'Text is empty' : null
                )),
              InkWell(
                onTap: () => onSubmit(context),
                child: Container(
                  margin: const EdgeInsets.only(top:20),
                    height: 40,
                    width: 205,
                    decoration: BoxDecoration(
                      color: _color[_index],
                      borderRadius: const BorderRadius.all(Radius.circular(30))),
                    child: const Center(
                        child: Text(
                          'Create',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
              ))))),
            ]),
        )));
  }
}

categories(int index) {
  List categories = <String>['Coffee', 'Bar', 'Food', 'Other'];
  List icons = <IconData>[Icons.coffee, Icons.celebration_outlined, Icons.local_restaurant, Icons.add_circle_sharp];
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
                const SizedBox(height: 10),
                Text(categories[index],
                    style: const TextStyle(
                      fontSize: 12,
                      fontFamily: 'helvetica',
                      color: Colors.white,
                    ))
              ])));
}

onSubmit(BuildContext context) {
   if (_formKey.currentState!.validate()) {
     Navigator.push( context, 
      MaterialPageRoute(builder: (context) => const CreateNew()));
   }
}