import 'package:lowkey/components/business.dart';

import 'Account.dart';

class Manager extends Account {
  String _bussinessNumber = "";
  String _employID = "";

  late Business managerOfBusiness;

  int priority = 1;

  Manager(
      String email, String password, String bussinessNumber, String employID)
      : super(email, password) {
    _bussinessNumber = bussinessNumber;
    _employID = employID;
  }

  String verifyBusiness() {
    String retVal = "";
    bool verified = false;

    return retVal;
  }
}
