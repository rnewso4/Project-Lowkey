import 'package:flutter/material.dart';
import 'package:lowkey/homepage_swipe.dart';
import 'package:lowkey/login.dart';
import 'business_page.dart';
import 'create_new.dart';
import 'homepage_list.dart';
import 'deals_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomepageList()
    );
  }
}

