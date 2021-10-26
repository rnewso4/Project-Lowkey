import 'package:lowkey/bussiness_category.dart';
import 'package:lowkey/deals.dart';
import 'package:lowkey/manager.dart';
import 'package:lowkey/news.dart';

class Business {
  String _name = "";
  String _address = "";
  String _description = "";

  late Manager _owner;

  List<Deals> listOfDeals = [];

  List<News> listOfNews = [];

  late BussinessCategory styleOfBussiness;

  Business(String name, String address, Manager owner) {
    _name = name;
    _address = address;
    _owner = owner;
  }

  void addDeals(Deals newDeal) {
    listOfDeals.add(newDeal);
    listOfDeals.sort();
  }

  void addNewws(News newNews) {
    listOfNews.add(newNews);
    listOfNews.sort((a, b) => a.getDate().compareTo(b.getDate()));
  }
}
