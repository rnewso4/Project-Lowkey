import 'package:lowkey/components/bussiness_category.dart';

class Account {
  String _email = "";
  String _password = "";

  late Priority _priorityType;

  Account(String email, String password, Priority priorityLVL) {
    _email = email;
    _password = password;
    _priorityType = priorityLVL;
  }

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }

  Priority getPriority() {
    return _priorityType;
  }
}
