import 'package:flutter/material.dart';
import 'package:lowkey/UI/create_new.dart';
import 'package:lowkey/components/utilities.dart';
import 'UI/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lowkey/UI/login.dart';
//import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'components/business.dart';
import 'components/bussiness_category.dart';
import 'components/customer.dart';
import 'components/deals.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());

  //Below is used to test Deals Order List. (Finished)
  Utilities tools = Utilities();
  List<Customer> testAccount = tools.getCurrentRegisterCustomerAccounts();
  List<Business> testBusiness = tools.generateDemoBusiness();
  testAccount[0].addFavoriteBusiness(testBusiness.last);

  if (testAccount[0].getPriority() == Priority.customer) {
    Customer currentCustomer = testAccount[0];
    tools.generateDealsOrder(currentCustomer, testBusiness);
  }
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
