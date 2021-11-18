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
        title: 'Lowkey',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const Login()
      ),
    );
  }
}