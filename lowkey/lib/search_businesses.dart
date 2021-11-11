import 'package:flutter/material.dart';
import 'package:lowkey/components/bottom_navbar.dart';
import 'package:lowkey/components/sidebar.dart';

class BusinessSearch extends StatefulWidget {
  const BusinessSearch({ Key? key }) : super(key: key);

  @override
  State<BusinessSearch> createState() => _BusinessSearchState();
}

class _BusinessSearchState extends State<BusinessSearch> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: _scaffoldState,
      body: Stack(
        children: <Widget> [
        const Center(
          child: Text(
            'HI'
          ),
        ),
        BottomNavbar(
          onMenuPressed: () => _scaffoldState.currentState?.openDrawer(), 
          iconLeft: Icons.tune, 
          backgroundColor: Colors.white, 
          onIconRightPressed: () {})
        ]
      ),
    );
  }
}