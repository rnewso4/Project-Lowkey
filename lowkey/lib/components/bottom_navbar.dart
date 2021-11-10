import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final Function onpressed;
  final IconData iconLeft;
  final Color backgroundColor;
  const BottomNavbar({ 
    Key? key, required this.onpressed, 
    required this.iconLeft, 
    required this.backgroundColor 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      color: backgroundColor,
      height: 70,
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.menu, size: 40, color: Colors.black),
          ),
        GestureDetector(
          onTap: onpressed(),
          child: Icon(iconLeft, size: 40, color: Colors.black)
        )
        ],
      ),
    ),
  );
  }
}