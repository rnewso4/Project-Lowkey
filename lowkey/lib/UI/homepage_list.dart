import 'package:flutter/material.dart';
import 'deals_page.dart';
import 'businesses.dart';
import 'create_new.dart';
import 'homepage_swipe.dart';

final PageController controller = PageController(initialPage: 0);

class HomepageList extends StatefulWidget {
  const HomepageList({Key? key}) : super(key: key);

  @override
  State<HomepageList> createState() => _HomepageListState();
}

class _HomepageListState extends State<HomepageList> {
  var _pageNum = 0;
  void pageChanged(page) {
    setState(() {
      _pageNum = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [dealsView(), newsView()];

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 90,
            padding: const EdgeInsets.only(top: 50, left: 30),
            child: Row(
              children: <Widget>[
                Text('Recent Deals',
                    style: (_pageNum == 0)
                        ? dealsAndNewsStyle()
                        : const TextStyle(color: Colors.grey)),
                const SizedBox(width: 40),
                Text('Top News',
                    style: (_pageNum == 1)
                        ? dealsAndNewsStyle()
                        : const TextStyle(color: Colors.grey))
              ],
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: controller,
              scrollDirection: Axis.horizontal,
              itemCount: pages.length,
              itemBuilder: (context, index) => pages[index],
              onPageChanged: pageChanged,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 70,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CreateNew()));
                      },
                      icon: const Icon(Icons.menu, size: 40)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomepageSwipe()));
                      },
                      icon: const Icon(Icons.tune, size: 40))
                ],
              ),
            ),
          ),
        ],
      ),
    );
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
    trailing: const Icon(Icons.more_vert),
    onTap: () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => DealsPage()));
    },
  );
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
  return Expanded(
    child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: businesses.length,
        itemBuilder: (context, index) => tilesForDeals(
            businesses[index].getName(),
            businesses[index].getLogo(),
            businesses[index].getDescription(),
            context),
        separatorBuilder: (context, index) => const SizedBox(height: 20)),
  );
}

newsView() {
  return Expanded(
    child: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: businesses.length,
        itemBuilder: (context, index) => tilesForNews(
            businesses[index].getNewsTitle(),
            businesses[index].getLogo(),
            businesses[index].getNewsDescription()),
        separatorBuilder: (context, index) => const SizedBox(height: 20)),
  );
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
