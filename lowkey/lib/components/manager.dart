import 'package:lowkey/components/business.dart';
import 'package:lowkey/components/bussiness_category.dart';
import 'account.dart';

class Manager extends Account {
  String _bussinessNumber = "";
  String _employID = "";

  late Business managerOfBusiness;

  late Priority priorityLVL;

  Manager(
      String email, String password, String bussinessNumber, String employID)
      : super(email, password, Priority.manager) {
    _bussinessNumber = bussinessNumber;
    _employID = employID;
    priorityLVL = Priority.manager;
  }

  String verifyBusiness() {
    String retVal = "";
    bool verified = false;

    return retVal;
  }
}
