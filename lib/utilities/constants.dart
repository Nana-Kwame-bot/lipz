import 'package:flutter/material.dart';

const kUrl =
    'https://api.edamam.com/api/nutrition-data?app_id=4433cd4c&app_key=f3f811159b0a95fd4c1d12efa5c72b56&ingr=';

const kPrimaryColor = Color(0xFFf4a03f);
const kPrimaryColorDark = Color(0xFFbd7105);
const kPrimaryColorLight = Color(0xFFffd16f);

const kStackMargin = const EdgeInsets.all(15.0);

const List<Color> kGradientColors = [
  kPrimaryColorDark,
  kPrimaryColor,
];

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon: Icon(
    Icons.restaurant_menu,
    color: Colors.white,
  ),
  hintText: 'Enter the amount + name',
  labelText: 'Search for a product',
  labelStyle: TextStyle(
    color: Colors.black38,
  ),
  hintStyle: TextStyle(
    color: Colors.grey,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    // borderSide: BorderSide.none,
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
  ),
  suffixIcon: Icon(
    Icons.search,
    color: kPrimaryColorDark,
  ),
);

const kListViewDivider = Divider(
  thickness: 1.0,
  indent: 20.0,
  endIndent: 20.0,
  color: kPrimaryColorDark,
);

const kStackPageDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.all(
    Radius.circular(40),
  ),
);

////// Columns in table.
const kTableColumns = <DataColumn>[
  DataColumn(
      label: const Text('Date'),
      tooltip: 'The day this food was added to the table'),
  DataColumn(
      label: const Text('Product Name'), tooltip: 'The name of the food'),
  DataColumn(
    label: const Text('Calories (kCal)'),
    tooltip: 'The total amount of food energy in the given serving size.',
    numeric: true,
  ),
  DataColumn(
    label: const Text('Energy (%)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Fat (%)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Protein (%)'),
    numeric: true,
  ),
  DataColumn(
    label: const Text('Cholesterol (%)'),
    numeric: true,
  ),
];
