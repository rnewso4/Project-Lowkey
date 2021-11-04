class News {
  String _title = "";
  String _description = "";
  late DateTime _date;

  News(String title, String description, String date) {
    _title = title;
    _description = description;
    _date = DateTime.parse(date);
  }

  DateTime getDate() {
    return _date;
  }
}
