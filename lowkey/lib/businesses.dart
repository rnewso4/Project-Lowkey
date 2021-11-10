class Business {
    var _logo = '';
    var _name = '';
    var _description = '';
    var _svg = "";
    final _date = 'Oct 18, 2021';
    final _newsTitle = 'How Ed Orgeron built championship …';
    final _newsDescription = 'Max Johnson had just taken a knee, pumped his fist and secured a thrilling win over Florida …';

Business(String name, String description, String logo) {
  _logo = logo;
  _name = name;
  _description = description;
  setSVGImage();

}

  void setSVGImage() {
    if (_name == 'Highland Coffee') {
      _svg = 'lib/assets/coffee.png';
    }
    else if (_name == 'The Revelry') {
      _svg = 'lib/assets/fizz.png';
    }
    else if (_name == 'Reginelli’s Pizzeria') {
      _svg = 'lib/assets/pizza.png';
    }
    else {
      _svg = 'lib/assets/coffee.png';
    }
  }

  String getSVGImage() {
    return _svg;
  }

  String getDate() {
    return _date;
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