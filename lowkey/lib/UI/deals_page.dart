import 'package:flutter/material.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({Key? key}) : super(key: key);

  @override
  _DealsPageState createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  double containerHeight = 500;
  IconData _iconData = Icons.arrow_upward_rounded;

  changeHeight() {
    setState(() {
      if (containerHeight <= 500) {
        containerHeight = 700;
        _iconData = Icons.arrow_downward_rounded;
      }
      else {
        containerHeight = 500;
        _iconData = Icons.arrow_upward_rounded;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap:() => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0),
      body: Stack(
        children: <Widget>[
          const Image(image: AssetImage('lib/assets/starbucks.jpg')),
          Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
              height: containerHeight,
              width: 400,
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0))),
              child: Column(
                children:  <Widget> [
                  const SizedBox(height: 15),
                  GestureDetector(onTap: changeHeight, child: Icon(_iconData)),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: const Text(
                      'Pumpkin Spice Cold Brew - Back For A Limited Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Text(
                      'Highland Coffee Cold Brew sweetened with vanilla syrup and topped with a pumpkin cream cold foam and a dusting of pumpkin spice topping.',
                      style: TextStyle(fontSize: 13))),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Posted 12 hours ago',
                          style: TextStyle(color: Color(0xff676666), fontSize: 12)),
                        Text(
                          'Expires 12/3',
                          style: TextStyle(
                            color: Color(0xff676666),
                            fontSize: 12))])),
                  const Divider(height: 20, thickness: 1, color: Color(0xff707070)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text('155K ',
                            style: TextStyle(
                              color: Color(0xff676666),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                          Text('Likes',
                            style: TextStyle(
                              color: Color(0xff676666),
                              fontSize: 12))]),
                      Row(
                        children: const <Widget>[
                          Text('3 ',
                            style: TextStyle(
                              color: Color(0xff676666),
                              fontWeight: FontWeight.bold,
                              fontSize: 14)),
                          Text('Comments',
                            style: TextStyle(
                              color: Color(0xff676666),
                              fontSize: 12))])]),
                  const Divider(height: 20, thickness: 1, color: Color(0xff707070)),
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                      itemCount: 3,
                      itemBuilder: (context, index) => comments(context, index),
                      separatorBuilder: (context, index) => const Divider(),
                    )
                  )
                ]
              )
            )
          )
        ]
      )
    );
  }
}

comments(context, index) {
  List<String> userName = ['Haley', "Abby Smith", "Stacia Jackson"];
  List<String> reviews = ['I actually LOVED it — and was surprised. At first I just tasted the cold brew, no pumpkin. If your straw is fully in the cup, you don’t taste the pumpkin at all — it’s literally just classic cold brew.',
  "Here's the gist: It's pretty similar to that Vanilla Sweet Cream Cold Brew we all know and love, but with a pumpkin cream foam instead. They froth the vanilla sweet cream and toss in some pumpkin spice for the effect. There's some pumpkin spice.",
  "So what should you order? It really depends on whether you want to go all in on the pumpkin flavor and are watching your macros or not. But all said and done, the Pumpkin Cream Cold Brew doesn't seem likely to unseat the PSL."];
  return SizedBox(
    height: 105,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(userName[index], style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Text( reviews[index],
                style: const TextStyle(fontSize: 13))])),
        /*Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(Icons.favorite_border),
                  Text('56')]),
              Column(
                children: const <Widget>[
                  Icon(Icons.comment_outlined),
                  Text('12M')
                ]
              )
            ]
          )
        )*/
      ]
    )
  );
}