import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.amber,
            height: 40,
            margin: const EdgeInsets.only(top: 35),
            alignment: Alignment.bottomCenter,
            child: const Text('Lowkey', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              itemCount: 3,
              itemBuilder: (context, index) => tiles()
            ),
          ),
        ],
      ),
    );
  }
}

tiles() {
  return const ListTile(
    leading: FlutterLogo(),
    title: Text('Home'),
  );
}