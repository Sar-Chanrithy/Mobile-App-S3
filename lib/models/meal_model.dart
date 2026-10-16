// To parse this JSON data, do
//
//     final mealModel = mealModelFromJson(jsonString);

import 'dart:convert';

MealModel mealModelFromJson(String str) => MealModel.fromJson(json.decode(str));

String mealModelToJson(MealModel data) => json.encode(data.toJson());

class MealModel {
  List<Meal> meals;

  MealModel({
    required this.meals,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) => MealModel(
        meals: json["meals"] == null
            ? []
            : List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;
  String strArea;
  String strCountry;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
    required this.strArea,
    required this.strCountry,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    String country = (json["strCountry"] ?? json["strArea"] ?? '').toString();
    if (country.isEmpty || country == 'null') {
      final name = (json["strMeal"] ?? '').toString().toLowerCase();
      if (name.contains('amok')) {
        country = 'Cambodia';
      } else if (name.contains('acaraje') || name.contains('moqueca')) {
        country = 'Brazil';
      } else if (name.contains('arroz') || name.contains('paella')) {
        country = 'Spain';
      } else if (name.contains('salmon') || name.contains('fish pie')) {
        country = 'United Kingdom';
      } else {
        country = 'Seafood';
      }
    }
    return Meal(
      strMeal: (json["strMeal"] ?? '').toString(),
      strMealThumb: (json["strMealThumb"] ?? '').toString(),
      idMeal: (json["idMeal"] ?? '').toString(),
      strArea: (json["strArea"] ?? country).toString(),
      strCountry: country,
    );
  }

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
        "strArea": strArea,
        "strCountry": strCountry,
      };
}