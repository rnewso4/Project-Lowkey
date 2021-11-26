import 'package:flutter/material.dart';
import 'package:lowkey/UI/deals_page.dart';
import 'global.dart';
import 'app_icons.dart';

int numOfComments = 3;

class DealsComponent extends StatelessWidget {
  const DealsComponent({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 8, 8),
      child: Column(
        children: <Widget> [
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Deals',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 2.0))),
          Container(
            height: 140,
            margin: const EdgeInsets.only(top: 20, bottom: 30),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: numOfDeals,
              itemBuilder: (context, index) => dealsCard(context))),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'News Stories',
              style: TextStyle(
                fontSize: 25,
                letterSpacing: 2.0))),
          Container(
            height: 140,
            margin: const EdgeInsets.only(top: 20, bottom: 27),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 7,
              itemBuilder: (context, index) => newsCard())) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Reviews', style: categoryTextStyle()),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text('4.3', style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700)),
                  Padding(
                    padding: EdgeInsets.only(bottom: 3),
                    child: Text(' out of 5', style: TextStyle(
                      color: Colors.grey)))
                ])]),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: numOfComments,
            itemBuilder: (context, index) => reviews(index)
          )
        ]
      )
    );
  }
}

dealsCard(BuildContext context) {
  return Stack(
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DealsPage()));
        },
        child: Container(
          margin: const EdgeInsets.only(right: 30),
          width: 200,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 2, 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    '\$5 off every coffee purchased before noon. Please see our terms and conditions for more info',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        'Posted 23 hours ago',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xff8E8E8E))),
                      Icon(MyFlutterApp.dollar, size: 20, color: Colors.grey),
                    ]
                  )
                ]
              ),
            )
          ),
        ),
      ),
      if(deleteCards) deleteIcon()
    ]
  );
}

Widget deleteIcon() {
  return Container(
    margin: const EdgeInsets.only(left: 145),
    child: RawMaterialButton(
      onPressed: () {
      },
      elevation: 2.0,
      fillColor: Colors.white,
      child: const Icon(Icons.close, size: 25.0, color: Colors.red),
      shape: const CircleBorder(),
    ),
  );
}

newsCard() {
  return Stack(
    children: <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 30),
        width: 200,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 2, 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'News Stories. Please see our terms and conditions for more info',
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Posted 23 hours ago',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xff8E8E8E))),
                    Icon(MyFlutterApp.dollar, size: 20, color: Colors.grey),
                  ]
                )
              ]
            ),
          )
        ),
      ),
      if (deleteCards) deleteIcon()
    ],
  );
}

categoryTextStyle() {
  return const TextStyle(
    fontSize: 25,
    letterSpacing: 3.0
  );
}

reviews(int index) {
return Container(
    margin: (index == (numOfComments-1)) ? const EdgeInsets.only(top: 10, bottom: 40) 
    : const EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const <Widget>[
            Text('Mike', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Oct 28')]),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(stringL),),
        const Divider(thickness: 2,)
      ],
    )
  );
}

var stringL = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, "
"sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " 
"Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris "
"nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in "
"reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
"Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt "
"mollit anim id est laborum.";