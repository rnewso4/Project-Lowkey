import 'package:flutter/material.dart';
import 'package:lowkey/create_business_page.dart';
import 'package:lowkey/forgot_password.dart';
import 'package:lowkey/manager_page.dart';
import 'package:lowkey/signup_page.dart';
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
        home: const ManagerPage()
      ),
    );
  }
}