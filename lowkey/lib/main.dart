import 'package:flutter/material.dart';
import 'package:lowkey/UI/create_new.dart';
import 'package:lowkey/components/utilities.dart';
import 'package:lowkey/login.dart';
import 'package:lowkey/manager_page.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:lowkey/UI/login.dart';
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

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
          title: 'Lowkey',
          theme: ThemeData(
            primarySwatch: Colors.grey,
          ),
          home: const Login()),
    );
  }
}
