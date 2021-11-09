import 'package:lowkey/components/business.dart';

import 'account.dart';
import 'package:lowkey/components/bussiness_category.dart';

class Customer extends Account {
  late Priority priorityLVL;
  List<Business> listOfFavoriteBussinesses = [];

  Customer(String email, String password) : super(email, password) {
    priorityLVL = Priority.Customer;
  }

  void addFavoriteBusiness(Business favoriteBus) {
    listOfFavoriteBussinesses.add(favoriteBus);
  }
}
