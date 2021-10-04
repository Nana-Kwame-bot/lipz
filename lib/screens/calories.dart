import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:lipz/services/nutrient_data.dart';
import 'package:lipz/services/product_data.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class Calories extends StatelessWidget {
  Calories({@required this.productDetails});
  final dynamic productDetails;
  @override
  Widget build(BuildContext context) {
    var _formatter = DateFormat('EEE, dd-MM-yyyy');
    String _formatted = _formatter.format(
      DateTime.now(),
    );
    return Container(
      margin: kStackMargin,
      decoration: kStackPageDecoration,
      child: Consumer<NutrientData>(
        builder: (BuildContext context, nutrientData, Widget child) {
          return FutureBuilder(
            future: productDetails,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  !snapshot.hasError &&
                  nutrientData.checkFoodName(snapshot.data)) {
                String _foodMatch = nutrientData.foodMatch;
                int _calories = snapshot.data['calories'] == null
                    ? 0
                    : snapshot.data['calories'];
                Provider.of<ProductData>(context).saveCalorieData(
                  currentDate: _formatted,
                  calorie: _calories,
                  food: _foodMatch,
                );
                double _percent = _calories / 2500;
                return Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 10.0,
                          ),
                          child: Text(
                            'Calories',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: kPrimaryColorDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        kListViewDivider,
                        CircularPercentIndicator(
                          radius: 160.0,
                          lineWidth: 13.0,
                          backgroundColor: kPrimaryColorLight,
                          animationDuration: 2000,
                          addAutomaticKeepAlive: true,
                          startAngle: 225,
                          animation: true,
                          percent: _percent > 1.0 ? 1.0 : _percent,
                          center: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Cal'),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                '$_calories',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text('of 2500'),
                            ],
                          ),
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: kPrimaryColorDark,
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return Column(
                  children: [
                    Expanded(
                      child: SpinKitDoubleBounce(
                        color: kPrimaryColor,
                        size: 100.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Calories',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: kPrimaryColorDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }
            },
          );
        },
      ),
    );
  }
}
