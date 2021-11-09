import 'customer.dart';

class Review {
  String _comment = "";
  int _stars = 0;
  late Customer _author;

  Review(String words, int rating) {
    _comment = words;
    _stars = rating;
  }
}
