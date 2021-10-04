class Food {
  Food({
    this.totalDaily,
  });

  TotalDaily totalDaily;

  factory Food.fromJson(Map<String, dynamic> json) => Food(
        totalDaily: TotalDaily.fromJson(json["totalDaily"]),
      );

// I omit the toJson() method since it's not used in this question
}

class TotalDaily {
  TotalDaily({
    this.enercKcal,
    this.fat,
    this.procnt,
    this.chole,
  });

  NutritionValue enercKcal;
  NutritionValue fat;
  NutritionValue procnt;
  NutritionValue chole;

  factory TotalDaily.fromJson(Map<String, dynamic> json) => TotalDaily(
        enercKcal: NutritionValue.fromJson(json["ENERC_KCAL"]),
        fat: NutritionValue.fromJson(json["FAT"]),
        procnt: NutritionValue.fromJson(json["PROCNT"]),
        chole: NutritionValue.fromJson(json["CHOLE"]),
      );
}

class NutritionValue {
  NutritionValue({
    this.quantity,
  });

  double quantity;

  factory NutritionValue.fromJson(Map<String, dynamic> json) => NutritionValue(
        quantity: json["quantity"],
      );
}
