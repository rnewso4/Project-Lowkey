import 'package:flutter/material.dart';
import 'package:lowkey/UI/components//businesses.dart';
import 'create_new.dart';
import 'package:lowkey/UI/components//business_comps.dart';
import 'package:lowkey/UI/components//bottom_navbar.dart';
import '../components/sidebar.dart';

bool isEmpty = true;

class ManagerPage extends StatefulWidget {
  final bool? showBackButton;
  const ManagerPage({Key? key, this.showBackButton}) : super(key: key);
  @override
  _ManagerPageState createState() => _ManagerPageState();
}

class _ManagerPageState extends State<ManagerPage> {
  void onPressed() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const CreateNew()));
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: _scaffoldState,
        drawer: const Sidebar(),
        backgroundColor: Colors.white,
        body: Stack(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 50),
              child: ListView(children: [
                !isEmpty
                    ? Container(
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        padding: const EdgeInsets.symmetric(vertical: 30),
                        child: Image(
                            width: 150,
                            image: AssetImage(businesses[3].getLogo())))
                    : SizedBox(height: 150),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Text(
                      'Highland coffee house is a small-business located near LSU that sells coffee and other stuff.',
                      textAlign: TextAlign.center,
                    )),
                Container(
                  height: 42,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(right: 0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        pageDetails(0),
                        pageDetails(1),
                        pageDetails(2),
                      ]),
                ),
                const DealsComponent()
              ])),
          header(context, widget.showBackButton),
          BottomNavbar(
              onIconRightPressed: onPressed,
              iconLeft: Icons.add,
              backgroundColor: Colors.white,
              onMenuPressed: () => _scaffoldState.currentState?.openDrawer())
        ]));
  }
}

List<Business> businesses = <Business>[
  Business('The Revelry', '\$5 off every coffee purchased before noon',
      'lib/UI/assets/rev.jpg'),
  Business('The Revelry', 'Our pumpkin spice pizza is back at high demand',
      'lib/UI/assets/rev.jpg'),
  Business('The Revelry', 'Students get in free before midnight',
      'lib/UI/assets/rev.jpg'),
  Business('Highland Coffee', '\$5 off every coffee purchased before noon',
      'lib/UI/assets/highland.png'),
  Business('Highland Cofee', 'Our pumpkin spice latte is back at high demand',
      'lib/UI/assets/highland.png'),
  Business('Highland Coffee', 'Doja Cat will be performing live on Saturday',
      'lib/UI/assets/highland.png'),
  Business('Reginelli’s Pizzeria', '\$5 off every coffee purchased before noon',
      'lib/UI/assets/reg.jpeg'),
  Business(
      'Reginelli’s Pizzeria',
      'Our pumpkin spice pizza is back at high demand',
      'lib/UI/assets/reg.jpeg'),
  Business('Reginelli’s Pizzeria',
      'Buy two, get a third one free every weekend', 'lib/UI/assets/reg.jpeg'),
];

pageDetails(index) {
  List categories = ['Address', 'Menu', 'Reviews'];
  bool istree = false;
  if (index == 2) {
    istree = true;
  }
  return Column(children: <Widget>[
    Text(categories[index]),
    istree ? const SizedBox(height: 5) : const SizedBox(),
    if (!isEmpty) businessDetails(index)
  ]);
}

businessDetails(index) {
  if (index == 0) {
    return const Icon(Icons.map);
  } else if (index == 1) {
    return const Icon(Icons.menu_book);
  } else {
    return const Text('2k');
  }
}

header(BuildContext context, bool? isTrue) {
  return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(10, 60, 5, 0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              if (isTrue ?? false)
                IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios)),
              Text(businesses[3].getName(),
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold))
            ]),
            const Icon(Icons.more_vert)
          ]));
}
