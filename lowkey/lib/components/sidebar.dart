import 'package:flutter/material.dart';
import 'package:lowkey/components/logo_style.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: const Color(0xff3C3C3C),
        child: Column(
          children: [
            Container(
              height: 50,
              margin: const EdgeInsets.only(top: 45, bottom: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    height: 50,
                    image: AssetImage('lib/assets/officiallogo2.png')
                  ),
                  const SizedBox(width: 8),
                  Text('LOWKEY', style: sidebarLogo),
                ],
              )),
             
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 0),
                itemCount: 3,
                itemBuilder: (context, index) => tiles(index)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

tiles(index) {
  List<String> categories = ['List View', 'Swipe View', 'Business Pages'];
  List<IconData> icons = [Icons.list, Icons.swipe, Icons.business];
  return ListTile(
    leading: Icon(icons[index], color: Colors.white,),
    title: Text(
      categories[index],
      style: const TextStyle(
        color: Colors.white,
      ),
      ),
  );
}