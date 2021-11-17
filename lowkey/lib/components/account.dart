class Account {
  String _email = "";
  String _password = "";

  Account(String email, String password) {
    _email = email;
    _password = password;
  }

  String getEmail() {
    return _email;
  }

  String getPassword() {
    return _password;
  }
}
