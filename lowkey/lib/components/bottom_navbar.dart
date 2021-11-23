import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {

  final Function onMenuPressed;
  final IconData? iconRight;
  final Color backgroundColor;
  final Function? onIconRightPressed;

  const BottomNavbar({ 
    Key? key, required this.onMenuPressed, 
    this.iconRight, 
    required this.backgroundColor,
    this.onIconRightPressed
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
              onTap: () => onMenuPressed(),
              child: const Icon(Icons.menu, size: 40, color: Colors.black)),
            if (iconRight != null) GestureDetector(
              onTap: (onIconRightPressed != null) ? () => onIconRightPressed!() : () {},
              child: Icon(iconRight, size: 40, color: Colors.black)
            )
          ]
        )
      )
    );
  }
}