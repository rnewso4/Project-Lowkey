import 'package:flutter/material.dart';
import 'package:lowkey/components/bottom_navbar.dart';
import 'package:lowkey/components/sidebar.dart';
import 'business_page.dart';

class BusinessSearch extends StatefulWidget {
  const BusinessSearch({Key? key}) : super(key: key);

  @override
  State<BusinessSearch> createState() => _BusinessSearchState();
}

class _BusinessSearchState extends State<BusinessSearch> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      key: _scaffoldState,
      appBar: AppBar(
        title: const Text('Search',
            style: TextStyle(
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBusiness());
              })
        ],
      ),
      body: Stack(children: <Widget>[
        const Center(
          child: Text('HI'),
        ),
        BottomNavbar(
            onMenuPressed: () => _scaffoldState.currentState?.openDrawer(),
            iconLeft: Icons.tune,
            backgroundColor: Colors.white,
            onIconRightPressed: () {})
      ]),
    );
  }
}

class SearchBusiness extends SearchDelegate<String> {
  final businesses = [
    'The Revelry',
    'Highland Coffee',
    'Reginelli\'s',
    'Starbucks',
    'Fred\'s Bar and Grill',
    'Walk-on\'s',
    'Superior Grill',
    'Cheeba Hut',
    'Zippy\'s'
        'Chipotle',
    'Chick-fil-a',
    'Panera Bread',
    'Counter Culture'
  ];
  final recentBusinesses = ['The Revelry', 'Highland Coffee', 'Superior Grill'];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? recentBusinesses
        : businesses.where((node) => node.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BusinessPage(showBackButton: true)));
        },
        leading: const Icon(Icons.store),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
