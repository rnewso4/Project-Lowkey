import 'package:flutter/material.dart';
import '../UI/components/businesses.dart';
import 'create_new.dart';
import '../UI/components/business_comps.dart';
import '../UI/components/bottom_navbar.dart';
import '../UI/components/sidebar.dart';

class BusinessPage extends StatefulWidget {
  final bool? showBackButton;
  final bool? isOwner;
  const BusinessPage({Key? key, this.showBackButton, this.isOwner}) : super(key: key);
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {
  void onPressed() {
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const CreateNew()));
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
            margin: const EdgeInsets.only(top:50),
            child: ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 120),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Image(
                    width: 150,
                    image: AssetImage(businesses[3].getLogo()))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Text(
                    'Highland coffee house is a small-business located near LSU that sells coffee and other stuff.',
                    textAlign: TextAlign.center)),
                Container(
                  height: 42,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(right: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      pageDetails(0),
                      pageDetails(1),
                      pageDetails(2),
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 70,
                        height: 30,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          color: Colors.grey),
                        child: const Center(
                          child: Text(
                            'Follow',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))))])),
                const DealsComponent()])),
          header(context, widget.showBackButton),
          BottomNavbar(
            iconRight: (widget.isOwner == true) ? Icons.edit : null,
            backgroundColor: Colors.white,
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer()
          )
        ]
      )
    );
  }
}

 List<Business> businesses = <Business>[
    Business('The Revelry', '\$5 off every coffee purchased before noon', 'lib/assets/rev.jpg'),
    Business('The Revelry', 'Our pumpkin spice pizza is back at high demand', 'lib/assets/rev.jpg'),
    Business('The Revelry', 'Students get in free before midnight', 'lib/assets/rev.jpg'),
    Business('Highland Coffee', '\$5 off every coffee purchased before noon', 'lib/assets/highland.png'),
    Business('Highland Cofee', 'Our pumpkin spice latte is back at high demand', 'lib/assets/highland.png'),
    Business('Highland Coffee', 'Doja Cat will be performing live on Saturday', 'lib/assets/highland.png'),
    Business('Reginelli’s Pizzeria', '\$5 off every coffee purchased before noon', 'lib/assets/reg.jpeg'),
    Business('Reginelli’s Pizzeria', 'Our pumpkin spice pizza is back at high demand', 'lib/assets/reg.jpeg'),
    Business('Reginelli’s Pizzeria', 'Buy two, get a third one free every weekend', 'lib/assets/reg.jpeg'),
  ];

pageDetails(index) {
  List categories = ['Address', 'Menu', 'Reviews'];
  bool istree = (index == 2) ? true : false;
  return Column(
    children: <Widget>[
      Text(categories[index]),
      istree ? const SizedBox(height: 5) : const SizedBox(),
      businessDetails(index)
    ]
  );
}

businessDetails(index) {
  switch (index) {
    case 0: return const Icon(Icons.map);
    case 1: return const Icon(Icons.menu_book);
  }
  return const Text('2k');
}

header(BuildContext context, bool? isTrue) {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(10, 60, 5, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            if (isTrue ?? false) IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios)),
            Text(
              businesses[3].getName(),
              style: const TextStyle(
                fontSize: 25, 
                fontWeight: FontWeight.bold))]),
        const Icon(Icons.more_vert)
      ]
    )
  );
}