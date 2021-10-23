import 'package:flutter/material.dart';

class CreateNew extends StatefulWidget {
  const CreateNew({Key? key}) : super(key: key);
  @override
  _CreateNewState createState() => _CreateNewState();
}

class _CreateNewState extends State<CreateNew> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back)),
      ),
      body: const Center(child: Text('hi')));
  }
}