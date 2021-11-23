import 'package:lowkey/components/business.dart';

import 'account.dart';
import 'package:lowkey/components/bussiness_category.dart';

class Customer extends Account {
  List<Business> _listOfFavoriteBussinesses = [];

  Customer(String email, String password)
      : super(email, password, Priority.customer);

  void addFavoriteBusiness(Business favoriteBus) {
    _listOfFavoriteBussinesses.add(favoriteBus);
  }

  List<Business> getFavoritedBusiness() {
    return _listOfFavoriteBussinesses;
  }
}
