import 'package:flutter/material.dart';
import '../UI/components/businesses.dart';
import 'create_new.dart';
import '../UI/components/business_comps.dart';
import '../UI/components/bottom_navbar.dart';
import '../UI/components/sidebar.dart';
import 'components/global.dart';

class BusinessPage extends StatefulWidget {
  final bool? showBackButton;
  final bool? isOwner;
  const BusinessPage({Key? key, this.showBackButton, this.isOwner}) : super(key: key);
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  void onPressed() {
    setState(() {
      deleteCards = !deleteCards;
    });
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldState,
      drawer: const Sidebar(),
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top:20),
            child: ListView(
              children: <Widget>[
                header(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    pageDetails(0),
                    pageDetails(1),
                    pageDetails(2)]),
                const Divider(thickness: 2, height: 30),
                const DealsComponent()])),
          BottomNavbar(
            iconRight: Icons.add,
            backgroundColor: Colors.white,
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
            onIconRightPressed: () => {Navigator.push( context, 
      MaterialPageRoute(builder: (context) => const CreateNew()))},
          )
        ]
      )
    );
  }
}

 List<Business> businesses = <Business>[
    //Business('PlayerVerse', '\$5 off every coffee purchased before noon', 'lib/assets/playerverse_logo.png'),
    Business('Reginelli’s Pizzeria', 'Buy two, get a third one free every weekend', 'lib/assets/reg.jpeg'),
  ];

pageDetails(index) {
  List categories = ['Address', 'Menu', 'Reviews'];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      children: <Widget>[
        Text(categories[index], style: const TextStyle(color: Color(0xff303030)),),
        const SizedBox(width: 3),
        businessDetails(index)
      ]
    ),
  );
}

businessDetails(index) {
  switch (index) {
    case 0: return const Icon(Icons.map);
    case 1: return const Icon(Icons.menu_book);
  }
  return const Text('2k', style: TextStyle(fontWeight: FontWeight.bold),);
}

header(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            SizedBox(
              height: 60,
              width: 60,
              child: Image(
                image: AssetImage(businesses[0].getLogo()))),
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    businesses[0].getName(),
                    style: const TextStyle(
                      fontSize: 20, 
                      fontWeight: FontWeight.bold)),
                  const Text(
                    '40.1K Followers',
                    style: TextStyle(
                      fontSize: 13, 
                      color: Color(0xff303030)))
                ]
              )
            )
          ]
        ),
        const Icon(Icons.notifications_active, size: 30)
      ]
    )
  );
}