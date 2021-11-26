import 'package:flutter/material.dart';
import 'package:lowkey/UI/analytics_page.dart';
import 'package:lowkey/UI/components/logo_style.dart';
import 'package:lowkey/UI/homepage_list.dart';
import 'package:lowkey/UI/homepage_swipe.dart';
import 'package:lowkey/UI/login.dart';
import 'package:lowkey/UI/search_businesses.dart';
import '../your_page.dart';
import 'global.dart' as global;
import 'page_transition.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xff3C3C3C),
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  margin: const EdgeInsets.only(top: 45, bottom: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Image(
                        height: 50,
                        image: AssetImage('lib/assets/officiallogo2.png')),
                      const SizedBox(width: 8),
                      Text('LOWKEY', style: sidebarLogo)])),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: global.isManager ? 5 : 3,
                    itemBuilder: (context, index) => tiles(context, index)))]),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.bottomCenter,
              child: tiles(context, global.isManager ? 5 : 3)
            )
          ],
        ),
      ),
    );
  }
}

Widget tiles(BuildContext context, int index) {
  List<String> categories = [
    'List View',
    'Swipe View',
    'Search',
    'Logout'
  ];

  List<IconData> icons = [
    Icons.list,
    Icons.swipe,
    Icons.search,
    Icons.logout
  ];

  List<Widget> onClick = [
    const HomepageList(),
    const HomepageSwipe(),
    const BusinessSearch(),
    const Login()
  ];

  if (global.isManager) {
    categories.insert(0, 'Dashboard');
    categories.insert(1, 'Your Page');
    icons.insert(0, Icons.dashboard);
    icons.insert(1, Icons.business);
    onClick.insert(0, const AnalyticsPage());
    onClick.insert(1, const YourPage());
  }

  return GestureDetector(
    onTap: () {
      Navigator.push(context, SlideRightRoute(page: onClick[index]));
      global.swipeIndex = 0;
      global.swipePageColorIndex = 0;
    },
    child: ListTile(
      leading: Icon(
        icons[index],
        color: Colors.white,
      ),
      title: Text(
        categories[index],
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}