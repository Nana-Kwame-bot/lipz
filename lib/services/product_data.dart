import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lipz/models/products.dart';

class ProductData extends ChangeNotifier {
  int _calories = 0;
  String _foodProduct = '';
  String _dateTime = '';
  List<ListTile> foodItems = [];
  List<Product> foodProducts = [];

  void addToTable(
      {String date,
      String productName,
      int calories,
      double energy,
      double fat,
      double protein,
      double cholesterol}) {
    foodProducts.add(
      Product(_dateTime, _foodProduct, _calories, energy, fat, protein,
          cholesterol),
    );
    notifyListeners();
  }

  void saveCalorieData({String currentDate, int calorie, String food}) {
    _calories = calorie;
    _dateTime = currentDate;
    _foodProduct = food;
  }

  void removeProduct(int index) {
    foodItems.removeAt(index);
    notifyListeners();
  }

  updateToday() {
    foodItems.add(
      ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              _dateTime,
            ),
            Text(
              toBeginningOfSentenceCase(_foodProduct),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              _calories.toString() + ' kCal',
            ),
          ],
        ),
      ),
    );
    notifyListeners();
  }
}
