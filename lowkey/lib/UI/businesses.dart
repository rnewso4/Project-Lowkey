class Business {
    var _logo = '';
    var _name = '';
    var _description = '';
    final _newsTitle = 'How Ed Orgeron built championship …';
    final _newsDescription = 'Max Johnson had just taken a knee, pumped his fist and secured a thrilling win over Florida …';

Business(String name, String description, String logo) {
  _logo = logo;
  _name = name;
  _description = description;
}

  String getNewsTitle() {
    return _newsTitle;
  }

  String getNewsDescription() {
    return _newsDescription;
  }

  String getLogo() {
    return _logo;
  }

  String getName() {
    return _name;
  }

  String getDescription() {
    return _description;
  }
}