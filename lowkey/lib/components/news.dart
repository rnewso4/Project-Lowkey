class News {
  String _title = "";
  String _description = "";
  String _date = "";

  News(String title, String description, String date) {
    _title = title;
    _description = description;
    _date = date;
  }

  String getDate() {
    return _date;
  }
}
