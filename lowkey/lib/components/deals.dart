import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deals {
  String _bussinesName = "";
  String _name = "";
  String _description = "";
  String _photo = "";
  late DateTime _startDate;
  late DateTime _endDate;

  Deals(String title, String description, String startDate, String endDate) {
    _name = title;
    _description = description;

    _startDate = DateTime.parse(startDate);
    _endDate = DateTime.parse(endDate);
  }
  String getName() {
    return _name;
  }

  void setBussinessName(String name) {
    _bussinesName = name;
  }

  DateTime getStartDate() {
    return _startDate;
  }

  DateTime getEndDate() {
    return _endDate;
  }
}
