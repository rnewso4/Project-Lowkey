import 'package:lowkey/components/bussiness_category.dart';
import 'package:lowkey/components/deals.dart';
import 'package:lowkey/components/manager.dart';
import 'package:lowkey/components/news.dart';

class Business {
  String _name = "";
  //String _address = "";
  String _description = "";
  int _longitude = 0;
  int _ladtitude = 0;

  late String _logo = "";

  late Manager _owner;

  List<Deals> _listOfDeals = [];
  List<Deals> _archivedDeals = [];
  int _dealIndex = 0;

  List<News> _listOfNews = [];
  List<News> _archivedNews = [];
  int _newsIndex = 0;

  late BussinessCategory _styleOfBussiness;

  late int _distanceFromUser;

  Business(
      String name, String description, BussinessCategory type, Manager owner) {
    _name = name;
    _description = description;
    _styleOfBussiness = type;
    _owner = owner;
  }

  String getName() {
    return _name;
  }

  Deals getDeal(int index) {
    _archiveOutdatedDeals();
    return _listOfDeals[index];
  }

  void addDeals(Deals newDeal) {
    newDeal.setBussinessName(_name);
    _dealIndex++;
    _listOfDeals.add(newDeal);
    _archiveOutdatedDeals();
    _listOfDeals.sort((a, b) => a.getStartDate().compareTo(b.getStartDate()));
  }

  void _archiveOutdatedDeals() {
    DateTime currentDate = DateTime.now();
    for (int i = _dealIndex - 1; i >= 0; i--) {
      if (_listOfDeals[i].getEndDate().isBefore(currentDate)) {
        Deals outdatedDeal = _listOfDeals.removeAt(i);
        _dealIndex--;

        _archivedDeals.add(outdatedDeal);
        _archivedDeals.sort((a, b) => a.getEndDate().compareTo(b.getEndDate()));
      }
    }
  }

  int getDealIndex() {
    return _dealIndex;
  }

  Deals _getArchivedDeal(int index) {
    return _archivedDeals[index];
  }

  News getNews(int index) {
    return _listOfNews[index];
  }

  void addNews(News newNews) {
    _listOfNews.add(newNews);
    _newsIndex++;
    _listOfNews.sort((a, b) => a.getDate().compareTo(b.getDate()));
  }

  int getNewsIndex() {
    return _newsIndex;
  }

  void changeLogo(String logoPath) {
    _logo = logoPath;
  }

  BussinessCategory getBussinessCategory() {
    return _styleOfBussiness;
  }

  void getDistance() {}
}
