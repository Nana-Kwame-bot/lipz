import 'package:flutter/material.dart';
import 'package:lipz/models/nutrients.dart';

class NutrientData extends ChangeNotifier {
  String foodMatch;
  Nutrient nutrient = Nutrient(
    energy: 0,
    fat: 0,
    protein: 0,
    cholesterol: 0,
  );

  bool checkFoodName(data) {
    if (data['ingredients'] == null ||
        data['ingredients'][0]['parsed'] == null ||
        data['ingredients'][0]['parsed'][0]['foodMatch'] == null) {
      return false;
    } else {
      foodMatch = data['ingredients'][0]['parsed'][0]['foodMatch'];
      return true;
    }
  }

  bool checkEnergyData(Nutrient nutrient, data) {
    if (data['totalDaily'] == null ||
        data['totalDaily']['ENERC_KCAL'] == null ||
        data['totalDaily']['ENERC_KCAL']['quantity'] == null) {
      return false;
    } else {
      nutrient.energy = data['totalDaily']['ENERC_KCAL']['quantity'];
      return true;
    }
  }

  bool checkFatData(Nutrient nutrient, data) {
    if (data['totalDaily'] == null ||
        data['totalDaily']['FAT'] == null ||
        data['totalDaily']['FAT']['quantity'] == null) {
      return false;
    } else {
      nutrient.fat = data['totalDaily']['FAT']['quantity'];
      return true;
    }
  }

  bool checkProteinData(Nutrient nutrient, data) {
    if (data['totalDaily'] == null ||
        data['totalDaily']['PROCNT'] == null ||
        data['totalDaily']['PROCNT']['quantity'] == null) {
      return false;
    } else {
      nutrient.protein = data['totalDaily']['PROCNT']['quantity'];
      return true;
    }
  }

  bool checkCholesterolData(Nutrient nutrient, data) {
    if (data['totalDaily'] == null ||
        data['totalDaily']['CHOLE'] == null ||
        data['totalDaily']['CHOLE']['quantity'] == null) {
      return false;
    } else {
      nutrient.cholesterol = data['totalDaily']['CHOLE']['quantity'];
      return true;
    }
  }
}
