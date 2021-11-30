import 'package:flutter/material.dart';
import 'package:lowkey/UI/analytics_page.dart';
import 'package:lowkey/UI/business_page.dart';
import 'package:lowkey/UI/your_page.dart';
import 'package:overlay_support/overlay_support.dart';
import 'UI/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lowkey',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: const BusinessPage()
      ),
    );
  }
}