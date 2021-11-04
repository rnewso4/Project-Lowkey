import 'package:lowkey/components/bussiness_category.dart';
import 'package:lowkey/components/deals.dart';
import 'package:lowkey/components/manager.dart';
import 'package:lowkey/components/news.dart';

class Business {
  String _name = "";
  String _address = "";
  String _description = "";
  int _longitude = 0;
  int _ladtitude = 0;

  late String _logo = "";

  late Manager _owner;

  List<Deals> listOfDeals = [];
  List<Deals> archivedDeals = [];

  List<News> listOfNews = [];
  List<News> archivedNews = [];

  late BussinessCategory styleOfBussiness;

  late int distanceFromUser;

  Business(String name, String address, Manager owner) {
    _name = name;
    _address = address;
    _owner = owner;
  }

  void addDeals(Deals newDeal) {
    listOfDeals.add(newDeal);
    listOfDeals.sort((a, b) => a.getEndDate().compareTo(b.getEndDate()));
  }

  void addNewws(News newNews) {
    listOfNews.add(newNews);
    listOfNews.sort((a, b) => a.getDate().compareTo(b.getDate()));
  }

  void changeLogo(String logoPath) {
    _logo = logoPath;
  }

  void getDistance() {}
}
