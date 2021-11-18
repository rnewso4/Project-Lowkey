import 'package:flutter/material.dart';
import 'package:lowkey/UI/create_new.dart';
import 'package:lowkey/components/bussiness_category.dart';
import 'package:lowkey/components/customer.dart';
import 'package:lowkey/components/deals.dart';
import 'package:lowkey/components/manager.dart';
import 'package:lowkey/components/news.dart';
import 'UI/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lowkey/UI/login.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lowkey/components/business.dart';
import 'package:lowkey/components/account.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  //Below is used to test Deals Order List. (Finished)

  /*List<Customer> testAccount = getCurrentRegisterCustomerAccounts();
  List<Business> testBusiness = generateDemoBusiness();
  testAccount[0].addFavoriteBusiness(testBusiness.last);

  if (testAccount[0].getPriority() == Priority.Customer) {
    Customer currentCustomer = testAccount[0];
    generateDealsOrder(currentCustomer, testBusiness);
  } */
}

bool checkCustomerLogin(String email, String password) {
  List<Customer> availableCustomerAccounts =
      getCurrentRegisterCustomerAccounts();

  for (int i = 0; i < availableCustomerAccounts.length; i++) {
    if (availableCustomerAccounts[i].getEmail() == email &&
        availableCustomerAccounts[i].getPassword() == password) {
      return true;
    }
  }
  return false;
}

bool checkManagerLogin(String email, String password) {
  List<Manager> availableManagerAccounts = getCurrentRegisterManagerAccounts();

  for (int i = 0; i < availableManagerAccounts.length; i++) {
    if (availableManagerAccounts[i].getEmail() == email &&
        availableManagerAccounts[i].getPassword() == password) {
      return true;
    }
  }
  return false;
}

List<Business> generateDemoBusiness() {
  Manager admin = Manager("admin@lsu.edu", "123abc", "(225)123-4567", "2021");
  List<Business> retVal = [];
  retVal.add(Business(
      "Coffee Club",
      "At Coffee Club we served a variety of different types of coffee and deserts.",
      BussinessCategory.Coffee,
      admin));

  retVal[0].addDeals(Deals(
      "Half off Cappuccino!",
      "On December 4th to December 6th all cappuccinos are half off",
      '2021-12-04',
      '2021-12-06'));

  retVal[0].addDeals(Deals(
      "Free Desert!",
      "Buy one desert get one free for a limited time only.",
      "2021-12-01",
      "2021-12-03"));

  retVal[0].addDeals(Deals(
      "10% off on Hot Chocolate!",
      "For the final week of Decemeber all Hot Chocolate will be 10% off",
      "2021-11-22",
      "2021-11-28"));

  retVal[0].addNews(News(
    "Doja Cat comes to town",
    "Doja Cat will be coming on November 30th to Coffee Club to sing her latest hits and meet some of her fans.",
  ));

  retVal[0].addNews(News("New Book club starting",
      "On December 3rd at 8:00 PM, a new book club is starting. Come to Coffee Club to learn more and meet other book lovers"));

  retVal[0].addNews(News("Board Game Fun Night",
      "On Decemeber 8th at 9:30 PM, Coffee Club is hosting a variety of board games and cards games. Come bring your friends and grab a coffee, and enjoy the awesome night."));

  retVal.add(Business(
      "Pizza Plaza",
      "At Pizza Plaza have a build your on style pizza place, where our workers will prepare your pizza in front of you.",
      BussinessCategory.Food,
      admin));

  retVal[1].addDeals(Deals(
      "15% on Meat Lovers Supreme!",
      "For this weekend get 15% on our special pizza, Meat Lovers Supreme.",
      "2021-12-04",
      "2021-12-05"));
  retVal[1].addDeals(Deals(
      "Build your own pizza 10% off!",
      "On November 30th to December 1st if you show us this deal in, Lowkey, you will get 10% off for one build your own pizza.",
      "2021-11-30",
      "2021-12-01"));
  retVal[1].addDeals(Deals(
      "Buy one pizza get one half off!",
      "For a limitied time if you buy one pizza get a second pizza for half price. Special pizzas are not included",
      "2021-12-09",
      "2021-12-11"));

  retVal[1].addNews(News("Create your own special",
      "One Decemeber 15th we will have a competion where our customer can create their own pizza, and the customer with the best pizza will get a \$25 gift card and their pizza will be added to our specials."));
  retVal[1].addNews(News("Kids Night",
      "On December 20th we will have a kids night, where are kids pizza is half off"));

  retVal.add(Business(
      "The Bar",
      "wheather you just want to meet new people or hang out with your friends, The Bar is the best place to be!",
      BussinessCategory.Bar,
      admin));

  retVal[2].addDeals(Deals(
      "Two shots for the price of one!",
      "While this deal is active, when you purchase one shot you get a second one free.",
      "2021-12-07",
      "2021-12-09"));
  retVal[2].addDeals(Deals(
      "25% off on all drinks!",
      "On December 3rd to the December 5th all drinks will be 25% off.",
      "2021-12-03",
      "2021-12-05"));
  retVal[2].addDeals(Deals("15% off on Beer!",
      "During this deal of bears are 15% off.", "2021-12-13", "2021-12-14"));

  retVal[2].addNews(News("Karoke Night",
      "On Decemebr 11th we be hosting a karoke night! So come grab a drink and party with your friends."));
  retVal[2].addNews(News("DJ Mike the Tiger",
      "On December 21st DJ Mike the Tiger is coming to DJ for us. for this event the entrance fee will be 25% cheaper!"));
  retVal[2].addNews(News("Time to Celebrate",
      "On December 30th we will throw a New Years party. So come start the year off right and come party with us!"));

  return retVal;
}

List<Customer> getCurrentRegisterCustomerAccounts() {
  List<Customer> retVal = [];
  retVal.add(Customer("user@lsu.edu", "Lowkey8"));
  retVal.add(Customer("customer@lsu.edu", "Lowkey8"));

  return retVal;
}

List<Manager> getCurrentRegisterManagerAccounts() {
  List<Manager> retVal = [];
  retVal.add(Manager("admin@lsu.edu", "123abc", "(225)123-4567", "2021"));

  return retVal;
}

List<Deals> generateDealsOrder(
    Customer currentUser, List<Business> availableBusiness) {
  List<Business> favoritedBusiness = currentUser.getFavoritedBusiness();
  List<Business> notFavoritedBusiness = [];

  List<Deals> dealsFromFavoriteBusiness = [];
  List<Deals> dealsFromRemainingBusiness = [];

  List<Deals> retVal = [];

  for (int i = 0; i < availableBusiness.length; i++) {
    bool favoredBusiness = false;
    for (int j = 0; j < favoritedBusiness.length && !favoredBusiness; j++) {
      if (availableBusiness[i].getName() == favoritedBusiness[j].getName()) {
        favoredBusiness = true;
      }
    }
    if (!favoredBusiness) {
      notFavoritedBusiness.add(availableBusiness[i]);
    }
  }

  for (int k = 0; k < favoritedBusiness.length; k++) {
    for (int l = 0; l < favoritedBusiness[k].getDealIndex(); l++) {
      dealsFromFavoriteBusiness.add(favoritedBusiness[k].getDeal(l));
    }
  }
  dealsFromFavoriteBusiness
      .sort((a, b) => a.getStartDate().compareTo(b.getStartDate()));

  for (int o = 0; o < notFavoritedBusiness.length; o++) {
    for (int p = 0; p < notFavoritedBusiness[o].getDealIndex(); p++) {
      dealsFromRemainingBusiness.add(notFavoritedBusiness[o].getDeal(p));
    }
  }
  dealsFromRemainingBusiness
      .sort((a, b) => a.getStartDate().compareTo(b.getStartDate()));

  retVal = dealsFromFavoriteBusiness + dealsFromRemainingBusiness;

  for (int i = 0; i < retVal.length; i++) {
    print(retVal[i].getName() +
        " Start date: " +
        retVal[i].getStartDate().toString());
  }
  return retVal;
}

List<Deals> generateNewsOrder(
    Customer currentUser, List<Business> availableBusiness) {
  List<Deals> retVal = [];

  return retVal;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
    );
  }

/*class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(30.412035, -91.183815);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lowkey'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 15.0,
          ),
        ),
      ),
    );
  } */
}
