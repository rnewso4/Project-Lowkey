import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
<<<<<<< HEAD
          title: 'Lowkey',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: const Login()),
=======
        title: 'Lowkey',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const Login()
      ),
>>>>>>> dc34006a0c2979d4b15d57bf9e678a2354ea51f3
    );
  }
}