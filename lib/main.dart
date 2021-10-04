import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lipz/screens/homepage.dart';
import 'package:lipz/services/nutrient_data.dart';
import 'package:lipz/services/product_data.dart';
import 'package:lipz/services/showcaseview_data.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      theme: ThemeData(
        accentColor: kPrimaryColorDark,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return ShowcaseViewData();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return ProductData();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return NutrientData();
            },
          )
        ],
        child: HomePage(),
      ),
    );
  }
}
