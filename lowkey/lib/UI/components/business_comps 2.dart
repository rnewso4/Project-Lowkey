import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lowkey/UI/deals_page.dart';
import 'global.dart';
import 'app_icons.dart';
import 'package:url_launcher/url_launcher.dart';

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
              itemBuilder: (context, index) => dealsCard(context, index))),
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
              itemCount: 2,
              itemBuilder: (context, index) => newsCard(index))) ,
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Reviews', style: categoryTextStyle()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Widget>[
                    Text('3.2', style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700)),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(' out of 5', style: TextStyle(
                        color: Colors.grey)))
                  ])]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: numOfComments,
              itemBuilder: (context, index) => reviews(index)
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 40),
            alignment: Alignment.topRight,
            child: TextButton(onPressed: () {}, 
              child: const Text(
                'View more',
                style: TextStyle(color: Colors.black)
                )),
          )
        ]
      )
    );
  }
}

dealsCard(BuildContext context, int index) {
  List<String> deals = ["Horizon Zero Dawn for \$20.04", "Psychonauts 2 for \$38.49", "Cyberpunk 2077 for \$24.99", "Pillars of Eternity II: Deadfire for \$11.29"];
  List<String> datePosted = ['23 hours', '2 days', '6 days', '1 week'];
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
                  Text(
                    deals[index],
                    style: const TextStyle(fontSize: 17)
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Posted ${datePosted[index]} ago',
                        style: const TextStyle(
                          fontSize: 11,
                          color: Color(0xff8E8E8E))),
                      const Icon(MyFlutterApp.dollar, size: 20, color: Colors.grey),
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

newsCard(int index) {
  List<String> newsStories = ["Dark Souls named 'Ultimate Game of All Time'", 
  "Pick up a Dell curved 32-inch 1440p FreeSync gaming monitor for \$330"];
  const String _url = 'https://www.pcgamer.com/dark-souls-named-ultimate-game-of-all-time/';
  List<String> postedDate = ['23 hours', '5 days'];
  void _launchURL() async {
    if (!await launch(_url)) throw 'Could not launch $_url';
  }
  return Stack(
    children: <Widget>[
      GestureDetector(
        onTap: _launchURL,
        child: Container(
          margin: const EdgeInsets.only(right: 30),
          width: 200,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 2, 6),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    newsStories[index],
                    style: const TextStyle(fontSize: 17)
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Posted ${postedDate[index]} ago',
                      style: const TextStyle(
                        fontSize: 11,
                        color: Color(0xff8E8E8E))),
                  )
                ]
              ),
            )
          ),
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
  List<String> usernames = ['Mike Johnson', 'Kevin Smith', 'Ryan Wilson'];
  List <String> datePosted = ['Oct 28', 'Nov 3', 'Nov 24'];
  List<double> rating = [4, 2.5, 3];
  return Container(
    margin: const EdgeInsets.only(top: 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(usernames[index], style: const TextStyle(fontWeight: FontWeight.bold)),
            RatingBar.builder(
              initialRating: rating[index],
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.only(right: 3.0),
              itemBuilder: (context, _) => const Icon( Icons.star, color: Colors.amber ),
              onRatingUpdate: (rating) { },
            ),
            Text(datePosted[index])]),
        /*Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 8),
          child: RatingBar.builder(
           initialRating: 3,
           minRating: 1,
           direction: Axis.horizontal,
           allowHalfRating: true,
           itemCount: 5,
           itemSize: 20,
           itemPadding: EdgeInsets.only(right: 3.0),
           itemBuilder: (context, _) => Icon(
             Icons.star,
             color: Colors.amber,
           ),
           onRatingUpdate: (rating) {
             print(rating);
           },
          ),
        ),*/
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(stringL[index]),),
        if (index != 2) const Divider(thickness: 2,)
      ],
    )
  );
}

List<String> stringL = ["Hello reader! I must admit, I grew up on video games. When my dad gave me the original Nintendo for Christmas, in 1998 whatever, I was a changed little ape. I lost touch with video games and my roots a few years back. I would buy a game, only to be disappointed. Then, about a year ago now, my friend Keith gave me this hot tip (intended) that I should look at the stock again, and my position as a whole as a consumer. I cannot tell you how many positive experiences I have had in PlayerVerse since. Most of them you would not believe anyway, but the customer service is clearly top priority.",
"It sucks. They never have consoles at store. You have to order whatever you want. Never in stock and when you get a chance to order it it keeps delaying. It takes like 2-3 weeks to get there and they say it's gonna be at your house the day after the purchase. Trust me don't go. It sucksss!!!!",
"I love the store. Great prices and product. It's just a few of the employees that work for this company really should work on their customer service a lot better. Be more attentive and understanding. Execute 1st come 1st service."];