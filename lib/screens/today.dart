import 'package:flutter/material.dart';
import 'package:lipz/services/nutrient_data.dart';
import 'package:lipz/services/product_data.dart';
import 'package:lipz/utilities/constants.dart';
import 'package:provider/provider.dart';

class Today extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
        ),
        color: Colors.white,
      ),
      child: Consumer<ProductData>(
        builder: (BuildContext context, productData, Widget child) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 10.0,
                ),
                child: Text(
                  'Today\'s Food',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: kPrimaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              kListViewDivider,
              Expanded(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Consumer<NutrientData>(
                      builder:
                          (BuildContext context, nutrientData, Widget child) {
                        double _energy = nutrientData.nutrient.energy;
                        double _fat = nutrientData.nutrient.fat;
                        double _protein = nutrientData.nutrient.protein;
                        double _cholesterol = nutrientData.nutrient.cholesterol;
                        return Dismissible(
                          key: ObjectKey(
                            productData.foodItems[index],
                          ),
                          onDismissed: (dismissDirection) {
                            if (dismissDirection ==
                                DismissDirection.startToEnd) {
                              productData.addToTable(
                                  energy: _energy,
                                  fat: _fat,
                                  protein: _protein,
                                  cholesterol: _cholesterol);
                              productData.removeProduct(index);
                            } else if (dismissDirection ==
                                DismissDirection.endToStart) {
                              productData.removeProduct(index);
                            }
                          },
                          child: productData.foodItems[index],
                          background: ListTile(
                            leading: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 50.0,
                            ),
                            tileColor: Colors.green,
                          ),
                          secondaryBackground: ListTile(
                            tileColor: Colors.red,
                            trailing: Icon(
                              Icons.delete,
                              color: Colors.black,
                              size: 50.0,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return kListViewDivider;
                  },
                  itemCount: productData.foodItems.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
