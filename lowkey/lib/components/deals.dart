import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deals {
  String _name = "";
  String _description = "";
  String _photo = "";
  late DateTime _startDate;
  late DateTime _endDate;

  Deals(String review, String description, String startDate, String endDate) {
    _name = review;
    _description = description;

    _startDate = DateTime.parse(startDate);
    _endDate = DateTime.parse(endDate);
  }

  DateTime getEndDate() {
    return _endDate;
  }
}
