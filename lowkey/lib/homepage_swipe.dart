import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lowkey/components/sidebar.dart';
import 'components/app_icons.dart';
import 'components/businesses.dart';
import 'components/page_transition.dart';
import 'homepage_list.dart';
import 'business_page.dart';
import 'components/bottom_navbar.dart';

final PageController controller = PageController(initialPage: 0);

class HomepageSwipe extends StatefulWidget {
  const HomepageSwipe({Key? key}) : super(key: key);
  @override
  _HomepageSwipeState createState() => _HomepageSwipeState();
}

//TODO: add more icons for the deals page

var index = 0;
var _isDealsView = true;
var colorIndex = 0;
var numOfDots = 3;

List<Color> _color = [
  const Color(0xffE6B781),
  const Color(0xff794016),
  const Color(0xffD04545),
  ];

class _HomepageSwipeState extends State<HomepageSwipe> {

  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

   List<Widget> pages = [
      dealsView(),
      newsView()
    ];

    void onPageChanged(page) {
      setState(() {
        if (index / 3 > page) {
          index -= 3;
          colorIndex -= 1;
        }
        else {
          index += 3;
          colorIndex += 1;
        }
      });
    }

    void textbuttonClicked() {
    setState(() {
      _isDealsView = !_isDealsView;
    });
  }

  @override
  Widget build(BuildContext context) {

  List<Widget> businessPages = [
    swippablePages(textbuttonClicked, context, _scaffoldState), 
    swippablePages(textbuttonClicked, context, _scaffoldState),
    swippablePages(textbuttonClicked, context, _scaffoldState)
  ];

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.centerRight,
          colors: <Color> [
            Colors.white,
            _color[colorIndex]
          ]
        ),
      ),
      child: Scaffold(
        key: _scaffoldState,
        drawer: const Sidebar(),
        backgroundColor: Colors.transparent,
        body: PageView.builder(
                controller: controller,
                scrollDirection: Axis.horizontal,
                itemCount: businessPages.length,
                itemBuilder: (context, index) => businessPages[index],
                onPageChanged: onPageChanged
      ),
      )
    );
  }
}

double svgSize() {
  double size = 0.0;
  if (businesses[index].getName() == 'Highland Coffee') {
    size = 280.0;
  }
  else if (businesses[index].getName() == 'The Revelry') {
    size = 180.0;
  }
  else if (businesses[index].getName() == 'Reginelli’s Pizzeria') {
    size = 240.0;
  }
  return size;
}

swippablePages(textbuttonClicked, BuildContext context, GlobalKey<ScaffoldState> _scaffoldState) {

  void onPressed() {
  Navigator.push( context, SlideRightRoute(page: const HomepageList()));
    index = 0;
    colorIndex = 0;
  }

  return Stack(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(top: 60, left: 10),
        child: Image(
          image: AssetImage(businesses[index].getLogo()), 
          width: 70
        )
      ),
      Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.only(top: 60),
        child: DotsIndicator(
          dotsCount: numOfDots,
          position: colorIndex.toDouble(),
          decorator: const DotsDecorator(
            color: Colors.black,
            activeSize: Size(19, 19),
            activeColor: Colors.black
          )
        )
      ),
      Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 130, bottom: 20),
            alignment: Alignment.topCenter,
            child: Text(
              businesses[index].getName(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold
              )
            )
          ),
          Image(
            image: AssetImage(businesses[index].getSVGImage()), 
            width: svgSize(),
          )
        ]
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 450,
          decoration: const BoxDecoration(
            color: Color(0xffF4F4F4),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50.0),
              topLeft: Radius.circular(50.0)
            )
          ),
          child: Stack(
            children: <Widget> [
              Column(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        TextButton(
                          onPressed: !_isDealsView ? textbuttonClicked : null,
                          child: Text(
                            'Recent Deals', 
                            style: _isDealsView ? dealsAndNewsStyle() : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                          )
                        ),
                        const SizedBox(width: 40),
                        TextButton(
                          onPressed: _isDealsView ? textbuttonClicked : null,
                          child: Text(
                            'Top News', 
                            style: !_isDealsView ? dealsAndNewsStyle() : const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)
                          )
                        )
                      ]
                    )
                  ),
                  _isDealsView ? dealsView() : newsView(),
                  BottomNavbar(
                    onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
                    iconLeft: Icons.tune,
                    backgroundColor: Colors.transparent,
                    onIconLeftPressed: onPressed,
                  )
                ]
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 50),
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: _color[colorIndex],
                    borderRadius: const BorderRadius.all(Radius.circular(30))
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const BusinessPage())
                    ),
                    child: const Center(
                      child: Text(
                        'OPEN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                        )
                      )
                    )
                  )
                )
              )
            ]
          )
        )
      )
    ],
  );
}

Widget dealsView() {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Row(
            children: <Widget>[
              Icon(MyFlutterApp.dollar, size: 50, color: _color[colorIndex]),
              Flexible(
                child: Text(businesses[index].getDescription(),
                style: const TextStyle(fontWeight: FontWeight.bold),),
              )
            ]
          ),
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: Icon(MyFlutterApp.coffee, size: 50, color: _color[colorIndex])),
              Flexible(
                child: Text(businesses[4].getDescription(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontWeight: FontWeight.bold),),
              )
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: <Widget>[
              Icon(MyFlutterApp.mic, size: 50, color: _color[colorIndex]),
              Text(businesses[5].getDescription(),
              style: const TextStyle(fontWeight: FontWeight.bold),)
            ],
          )
        ]),
    )
  );
}

Widget newsView() {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        children: <Widget>[
          Text(
            businesses[index].getNewsTitle(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: _color[colorIndex],
              fontSize: 17
            )
          ),
          const SizedBox(height: 20),
          Text(businesses[index].getNewsDescription()),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(businesses[index].getDate(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _color[colorIndex]
                )
              ),
              Text('Read More',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: _color[colorIndex]
                )
              )
            ]
          )
        ]
      )
    )
  );
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

  dealsAndNewsStyle() => const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black);