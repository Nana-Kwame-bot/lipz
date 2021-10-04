import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:lipz/services/nutrient_data.dart';

class Nutrients extends StatelessWidget {
  Nutrients({this.productDetails});
  final dynamic productDetails;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 20.0,
      ),
      margin: kStackMargin,
      decoration: kStackPageDecoration,
      child: Consumer<NutrientData>(
        builder: (BuildContext context, nutrientData, Widget child) {
          final _nutrient = nutrientData.nutrient;
          return FutureBuilder(
            future: productDetails,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  !snapshot.hasError &&
                  snapshot.data != null &&
                  nutrientData.checkEnergyData(_nutrient, snapshot.data) &&
                  nutrientData.checkFatData(_nutrient, snapshot.data) &&
                  nutrientData.checkProteinData(_nutrient, snapshot.data) &&
                  nutrientData.checkCholesterolData(_nutrient, snapshot.data)) {
                double _energy = nutrientData.nutrient.energy;
                double _fat = nutrientData.nutrient.fat;
                double _protein = nutrientData.nutrient.protein;
                double _cholesterol = nutrientData.nutrient.cholesterol;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 10.0,
                        ),
                        child: Text(
                          'Nutrient Values',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: kPrimaryColorDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      kListViewDivider,
                      ListTile(
                        dense: true,
                        leading: Text('Energy'),
                        title: LinearProgressIndicator(
                          value: _energy / 100.toDouble(),
                          backgroundColor: kPrimaryColorLight,
                        ),
                        trailing: Text(
                          _energy.toStringAsFixed(1) + ' %',
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Text('Fat'),
                        title: LinearProgressIndicator(
                          value: _fat / 100.toDouble(),
                          backgroundColor: kPrimaryColorLight,
                        ),
                        trailing: Text(
                          _fat.toStringAsFixed(1) + ' %',
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Text('Protein'),
                        title: LinearProgressIndicator(
                          value: _protein / 100.toDouble(),
                          backgroundColor: kPrimaryColorLight,
                        ),
                        trailing: Text(
                          _protein.toStringAsFixed(1) + ' %',
                        ),
                      ),
                      ListTile(
                        dense: true,
                        leading: Text('Cholesterol'),
                        title: LinearProgressIndicator(
                          value: _cholesterol / 100.toDouble(),
                          backgroundColor: kPrimaryColorLight,
                        ),
                        trailing: Text(
                          _cholesterol.toStringAsFixed(1) + ' %',
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        'Nutrient Values',
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
