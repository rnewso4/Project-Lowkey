import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../UI/components/bottom_navbar.dart';
import '../UI/components/sidebar.dart';

  List<Color> gradientColors = [
    const Color(0xff8A15FF),
    const Color(0xffD86EFF),
  ];

  List graphTitles = <String>['Followers', 'Likes', 'Comments'];
  List currentGraphMetrics = <String>['265K', '4.5M', '10K'];
  int _index = 0;


class AnalyticsPage extends StatefulWidget {
  const AnalyticsPage({Key? key}) : super(key: key);
  @override
  _AnalyticsPageState createState() => _AnalyticsPageState();
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  updateChart(int num) {
    setState(() {
      _index = num;
    });
  }
    
  return Scaffold(
    key: _scaffoldState,
    drawer: const Sidebar(),
    backgroundColor: Colors.white,
    body: Column(
      children: <Widget>[
        header(),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 20),
          alignment: Alignment.topLeft,
          child: const Text(
            'November 2021 Summary', 
            style: TextStyle(
              color: Color(0xff454545),
              fontWeight: FontWeight.bold,
              fontSize: 16))),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              //topCards('Active Deals', 5),
              topCards('Active Deals', 5),
              topCards('New Followers', 71),
              topCards('Page Visits', 873)])),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 20),
          alignment: Alignment.topLeft,
          child: const Text(
            'Top Deal', 
            style: TextStyle(
              color: Color(0xff454545),
              fontWeight: FontWeight.bold,
              fontSize: 16))),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
          alignment: Alignment.topLeft,
          child: const Text('Pumpkin Spice Cold Brew - Back For A Limited Time')),
        dealStatistics('Seen by', 26.5),
        dealStatistics('Comments', 5),
        dealStatistics('Favorites', 10.3),
        Container(
          margin: const EdgeInsets.only(top: 50),
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () => updateChart(index),
                  child: categories(index));
            })),
        Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Color(0xff1C2139)),
          margin: const EdgeInsets.only(top: 20, right: 20, left: 20),
          padding: const EdgeInsets.all(10),
          height: 230,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      graphTitles[_index], 
                      style: const TextStyle(
                        color: Color(0xffA0A0A0),
                        fontSize: 16)),
                    Text(
                      currentGraphMetrics[_index], 
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w800))])),
              businessChart()])),
        Expanded(
          child: BottomNavbar(
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
            //iconLeft: Icons.tune, 
            backgroundColor: Colors.white,
            //onIconRightPressed: () {}
          )
        )
      ])
    );
  }
}

Widget categories(int index) {
  return InkWell(
    child: Container(
      margin: EdgeInsets.only(right: 30, left: (index == 0) ? 10 : 0),
      width: 95,
      decoration: BoxDecoration(
        color: (_index == index) ? const Color(0xff1C2139) : Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(30))),
      child: Center(
        child: Text(
          graphTitles[index],
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'helvetica',
            color: (_index == index) ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold
          )
        )
      )
    )
  );
}

Widget dealStatistics(String title, double percent) {
  Color _color = (percent > 9) ? Colors.green : Colors.red;
  IconData arrowDirection = (percent > 9) ? Icons.arrow_upward : Icons.arrow_downward;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(title),
        Row(
          children: <Widget>[
            const SizedBox(
              width: 50,
              child: Text('237.4K')),
            const SizedBox(width: 5),
            SizedBox(
              width: 30,
              child: Icon(arrowDirection, color: _color)),
            Container(
              alignment: Alignment.centerRight,
              width: 60,
              child: Text('$percent %', style: TextStyle(color: _color, fontWeight: FontWeight.bold)
              )
            )
          ]
        )
      ]
    ),
  );
}

Widget header() {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.fromLTRB(10, 60, 5, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const <Widget>[
        Text(
          'Business Dashboard',
          style: TextStyle(
            fontSize: 28, 
            fontWeight: FontWeight.bold,
            letterSpacing: 1.7
          )
        )
      ]
    )
  );
}

Widget topCards(String title, int metrics) {
  return Container(
    height: 60,
    width: 110,
    decoration: const  BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
          color: Colors.grey,
          blurRadius: 10.0, // soften the shadow
          spreadRadius: 1.0, //extend the shadow
          offset: Offset(
            4, // Move to right 10  horizontally
            6, // Move to bottom 10 Vertically
          ))]),
    child: Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 5, bottom: 7),
          child: Text(title,
          style: const TextStyle(
            color: Color(0xff454545),
            fontSize: 14))),
        Text(metrics.toString(),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold
          )
        )
      ]
    )
  );
}

Widget businessChart() {

   List<FlSpot> followerDataPoints = const [
    FlSpot(0, 0), FlSpot(4, 0), FlSpot(4.9, 1), FlSpot(6.8, 2.5), 
    FlSpot(8, 4), FlSpot(10, 3), FlSpot(11, 4)
  ];
  List<FlSpot> likesDataPoints = const [
    FlSpot(0, 4), FlSpot(3, 3.2), FlSpot(4.3, 3.25), FlSpot(6.8, 0), 
    FlSpot(8, 0.4), FlSpot(10, 3), FlSpot(11, 4)
  ];
  List<FlSpot>commentsDataPoints = const [
    FlSpot(0, 3), FlSpot(3, 3.2), FlSpot(4.3, 3.25), FlSpot(6.8, 2.87), 
    FlSpot(8, 2.9), FlSpot(10, 3.56), FlSpot(11, 4)
  ];
  List spots = [followerDataPoints, likesDataPoints, commentsDataPoints];

  return Expanded(
    child: LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 6,
        gridData: FlGridData(
          show: true,
          drawVerticalLine: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1);
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1);
          }),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: SideTitles(
            showTitles: true,
            reservedSize: 22,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff68737d),
              fontWeight: FontWeight.bold,
              fontSize: 16),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1: return 'Feb';
                case 4: return 'May';
                case 7: return 'Aug';
                case 10: return 'Nov';
              }
              return "";
            },
            margin: 8,),
          leftTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTextStyles: (context, value) => const TextStyle(
              color: Color(0xff67727d),
              fontWeight: FontWeight.bold,
              fontSize: 15),
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return '10k';
                case 3:
                  return '30k';
                case 5:
                  return '50k';
              }
              return '';
            },
            reservedSize: 32,
            margin: 12),
          topTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(showTitles: false)),
        lineBarsData: <LineChartBarData>[
          LineChartBarData(
            spots: spots[_index],
            isCurved: true,
            colors: gradientColors,
            barWidth: 5,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show:true,
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList()
            )
          )
        ]
      )
    ),
  );
}

