import 'package:flutter/material.dart';
import 'deals_page.dart';
import 'UI/components/businesses.dart';
import 'homepage_swipe.dart';
import 'UI/components/bottom_navbar.dart';
import 'UI/components/sidebar.dart';

final PageController controller = PageController(initialPage: 0);

class HomepageList extends StatefulWidget {
  const HomepageList({Key? key}) : super(key: key);

  @override
  State<HomepageList> createState() => _HomepageListState();
}

class _HomepageListState extends State<HomepageList> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  var _pageNum = 0;
  void pageChanged(page) {
    setState(() {
      _pageNum = page;
    });
  }

  void onPressed() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const HomepageSwipe()));
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [dealsView(), newsView()];

    return Scaffold(
        key: _scaffoldState,
        drawer: const Sidebar(),
        body: Column(children: <Widget>[
          Container(
              height: 90,
              padding: const EdgeInsets.only(top: 50, left: 30),
              child: Row(children: <Widget>[
                Text('Recent Deals',
                    style: (_pageNum == 0)
                        ? dealsAndNewsStyle()
                        : const TextStyle(color: Colors.grey)),
                const SizedBox(width: 40),
                Text('Top News',
                    style: (_pageNum == 1)
                        ? dealsAndNewsStyle()
                        : const TextStyle(color: Colors.grey))
              ])),
          Expanded(
              child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
            onPageChanged: pageChanged,
          )),
          BottomNavbar(
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
            iconLeft: Icons.tune,
            backgroundColor: Colors.white,
            onIconRightPressed: () {},
          )
        ]));
  }
}

dealsAndNewsStyle() => const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);

tilesForDeals(String name, String logo, String description, context) {
  return ListTile(
      leading: Image(
        image: AssetImage(logo),
        width: 70,
      ),
      title: Text(name),
      subtitle: Text(description),
      trailing: const Icon(Icons.star_outline),
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const DealsPage()));
      });
}

tilesForNews(String name, String logo, String description) {
  return ListTile(
      leading: Image(
        image: AssetImage(logo),
        width: 70,
      ),
      title: Text(name),
      subtitle: Text(description),
      trailing: const Icon(Icons.more_vert));
}

dealsView() {
  return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: businesses.length,
      itemBuilder: (context, index) => tilesForDeals(
          businesses[index].getName(),
          businesses[index].getLogo(),
          businesses[index].getDescription(),
          context),
      separatorBuilder: (context, index) => const SizedBox(height: 20));
}

newsView() {
  return ListView.separated(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: businesses.length,
      itemBuilder: (context, index) => tilesForNews(
          businesses[index].getNewsTitle(),
          businesses[index].getLogo(),
          businesses[index].getNewsDescription()),
      separatorBuilder: (context, index) => const SizedBox(height: 20));
}

List<Business> businesses = <Business>[
  Business('The Revelry', '\$5 off every coffee purchased before noon',
      'lib/assets/rev.jpg'),
  Business('The Revelry', 'Our pumpkin spice pizza is back at high demand',
      'lib/assets/rev.jpg'),
  Business('The Revelry', 'Students get in free before midnight',
      'lib/assets/rev.jpg'),
  Business('Highland Coffee', '\$5 off every coffee purchased before noon',
      'lib/assets/highland.png'),
  Business('Highland Cofee', 'Our pumpkin spice latte is back at high demand',
      'lib/assets/highland.png'),
  Business('Highland Coffee', 'Doja Cat will be performing live on Saturday',
      'lib/assets/highland.png'),
  Business('Reginelli’s Pizzeria', '\$5 off every coffee purchased before noon',
      'lib/assets/reg.jpeg'),
  Business('Reginelli’s Pizzeria',
      'Our pumpkin spice pizza is back at high demand', 'lib/assets/reg.jpeg'),
  Business('Reginelli’s Pizzeria',
      'Buy two, get a third one free every weekend', 'lib/assets/reg.jpeg'),
];
