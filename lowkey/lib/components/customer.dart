import 'package:lowkey/components/business.dart';

import 'account.dart';
import 'package:lowkey/components/bussiness_category.dart';

class Customer extends Account {
  List<Business> listOfFavoriteBussinesses = [];

  Customer(String email, String password)
      : super(email, password, Priority.Customer) {}

  void addFavoriteBusiness(Business favoriteBus) {
    listOfFavoriteBussinesses.add(favoriteBus);
  }

  List<Business> getFavoritedBusiness() {
    return listOfFavoriteBussinesses;
  }
}
