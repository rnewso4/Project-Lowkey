import 'package:flutter/material.dart';
import 'homepage_list.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({Key? key}) : super(key: key);

  @override
  _DealsPageState createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          onTap:() => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.transparent,
        elevation: 0
      ),
      body: Stack(
        children: <Widget>[
          const Image(
            image: AssetImage('lib/assets/starbucks.jpg'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 500,
              width: 400,
              decoration: const BoxDecoration(
                color: Color(0xffF4F4F4),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40.0),
                  topLeft: Radius.circular(40.0)),
              ),
              child: Column(
                children:  <Widget> [
                  const SizedBox(height: 15),
                  const Text(
                    '250 characters max for comments',
                    style: TextStyle(
                      color: Color(0xff707070)
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Pumpkin Spice Cold Brew - Back For A Limited Time',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: const Text(
                      'Starbucks® Cold Brew sweetened with vanilla syrup and topped with a pumpkin cream cold foam and a dusting of pumpkin spice topping.',
                      style: TextStyle(
                        fontSize: 13
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          'Posted 12 hours ago',
                          style: TextStyle(
                            color: Color(0xff676666),
                            fontSize: 12
                          )
                        ),
                        Text(
                          'Expires 10/29',
                          style: TextStyle(
                            color: Color(0xff676666),
                            fontSize: 12
                          )
                        )
                      ]
                    ),
                  ),
                const Divider(
                  height: 20,
                  thickness: 1,
                  color: Color(0xff707070)
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: const <Widget>[
                        Text('155K ',
                        style: TextStyle(
                          color: Color(0xff676666),
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        )
                        ),
                        Text('Likes',
                        style: TextStyle(
                          color: Color(0xff676666),
                          fontSize: 12
                        )
                        )
                      ],),
                      Row(
                      children: const <Widget>[
                        Text('2K ',
                        style: TextStyle(
                          color: Color(0xff676666),
                          fontWeight: FontWeight.bold,
                          fontSize: 14
                        )
                        ),
                        Text('Comments',
                        style: TextStyle(
                          color: Color(0xff676666),
                          fontSize: 12
                        )
                        )
                      ],)
                  ],
                  ),
                  const Divider(
                  height: 20,
                  thickness: 1,
                  color: Color(0xff707070)
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                    itemCount: 7,
                    itemBuilder: (context, index) => comments(context, index),
                    separatorBuilder: (context, index) => const Divider(),
                  ),
                )
                ]
              )
            ),
          )
        ],
      )
    );
  }
}

comments(context, index) {
  return SizedBox(
    height: 105,
    child: Row(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text('Mommy Blogger 216',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                )
              ),
              SizedBox(height: 5),
              Text(
                'Lorem ipsum dolor sit amet, consectetuer adipi elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam fe',
                style: TextStyle(
                  fontSize: 13
                )
                )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.favorite_border
                  ),
                  Text('56')
                ],
              ),
              Column(
                children: const <Widget>[
                  Icon(
                    Icons.comment_outlined
                  ),
                  Text('12M')
                ],
              )
            ],
          ),
        )
      ]
    )
  );
}