import '../Account.dart';

class Customer extends Account {
  int priority = 0;

  Customer(String email, String password) : super(email, password) {}
}
