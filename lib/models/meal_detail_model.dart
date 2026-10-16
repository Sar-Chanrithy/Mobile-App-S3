// To parse this JSON data, do
//
//     final mealDetailModel = mealDetailModelFromJson(jsonString);

import 'dart:convert';

MealDetailModel mealDetailModelFromJson(String str) =>
    MealDetailModel.fromJson(json.decode(str));

String mealDetailModelToJson(MealDetailModel data) =>
    json.encode(data.toJson());

class MealDetailModel {
  List<MealElement> meals;

  MealDetailModel({
    required this.meals,
  });

  factory MealDetailModel.fromJson(Map<String, dynamic> json) =>
      MealDetailModel(
        meals: json["meals"] == null
            ? []
            : List<MealElement>.from(
                json["meals"].map((x) => MealElement.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class MealElement {
  String idMeal;
  String strMeal;
  dynamic strMealAlternate;
  String strCategory;
  String strArea;
  String strCountry;
  String strInstructions;
  String strMealThumb;
  dynamic strTags;
  dynamic strYoutube;
  dynamic strIngredient1;
  dynamic strIngredient2;
  dynamic strIngredient3;
  dynamic strIngredient4;
  dynamic strIngredient5;
  dynamic strIngredient6;
  dynamic strIngredient7;
  dynamic strIngredient8;
  dynamic strIngredient9;
  dynamic strIngredient10;
  dynamic strIngredient11;
  dynamic strIngredient12;
  dynamic strIngredient13;
  dynamic strIngredient14;
  dynamic strIngredient15;
  dynamic strIngredient16;
  dynamic strIngredient17;
  dynamic strIngredient18;
  dynamic strIngredient19;
  dynamic strIngredient20;
  dynamic strMeasure1;
  dynamic strMeasure2;
  dynamic strMeasure3;
  dynamic strMeasure4;
  dynamic strMeasure5;
  dynamic strMeasure6;
  dynamic strMeasure7;
  dynamic strMeasure8;
  dynamic strMeasure9;
  dynamic strMeasure10;
  dynamic strMeasure11;
  dynamic strMeasure12;
  dynamic strMeasure13;
  dynamic strMeasure14;
  dynamic strMeasure15;
  dynamic strMeasure16;
  dynamic strMeasure17;
  dynamic strMeasure18;
  dynamic strMeasure19;
  dynamic strMeasure20;
  dynamic strSource;
  dynamic strImageSource;
  dynamic strCreativeCommonsConfirmed;
  dynamic dateModified;

  MealElement({
    required this.idMeal,
    required this.strMeal,
    this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strCountry,
    required this.strInstructions,
    required this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strIngredient16,
    this.strIngredient17,
    this.strIngredient18,
    this.strIngredient19,
    this.strIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory MealElement.fromJson(Map<String, dynamic> json) {
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
        country = json["strArea"]?.toString() ?? 'Seafood';
      }
    }

    return MealElement(
      idMeal: json["idMeal"].toString(),
      strMeal: json["strMeal"].toString(),
      strMealAlternate: json["strMealAlternate"].toString(),
      strCategory: json["strCategory"].toString(),
      strArea: json["strArea"].toString(),
      strCountry: country,
      strInstructions: json["strInstructions"].toString(),
      strMealThumb: json["strMealThumb"].toString(),
      strTags: json["strTags"].toString(),
      strYoutube: json["strYoutube"].toString(),
      strIngredient1: json["strIngredient1"].toString(),
      strIngredient2: json["strIngredient2"].toString(),
      strIngredient3: json["strIngredient3"].toString(),
      strIngredient4: json["strIngredient4"].toString(),
      strIngredient5: json["strIngredient5"].toString(),
      strIngredient6: json["strIngredient6"].toString(),
      strIngredient7: json["strIngredient7"].toString(),
      strIngredient8: json["strIngredient8"].toString(),
      strIngredient9: json["strIngredient9"].toString(),
      strIngredient10: json["strIngredient10"].toString(),
      strIngredient11: json["strIngredient11"].toString(),
      strIngredient12: json["strIngredient12"].toString(),
      strIngredient13: json["strIngredient13"].toString(),
      strIngredient14: json["strIngredient14"].toString(),
      strIngredient15: json["strIngredient15"].toString(),
      strIngredient16: json["strIngredient16"].toString(),
      strIngredient17: json["strIngredient17"].toString(),
      strIngredient18: json["strIngredient18"].toString(),
      strIngredient19: json["strIngredient19"].toString(),
      strIngredient20: json["strIngredient20"].toString(),
      strMeasure1: json["strMeasure1"].toString(),
      strMeasure2: json["strMeasure2"].toString(),
      strMeasure3: json["strMeasure3"].toString(),
      strMeasure4: json["strMeasure4"].toString(),
      strMeasure5: json["strMeasure5"].toString(),
      strMeasure6: json["strMeasure6"].toString(),
      strMeasure7: json["strMeasure7"].toString(),
      strMeasure8: json["strMeasure8"].toString(),
      strMeasure9: json["strMeasure9"].toString(),
      strMeasure10: json["strMeasure10"].toString(),
      strMeasure11: json["strMeasure11"].toString(),
      strMeasure12: json["strMeasure12"].toString(),
      strMeasure13: json["strMeasure13"].toString(),
      strMeasure14: json["strMeasure14"].toString(),
      strMeasure15: json["strMeasure15"].toString(),
      strMeasure16: json["strMeasure16"].toString(),
      strMeasure17: json["strMeasure17"].toString(),
      strMeasure18: json["strMeasure18"].toString(),
      strMeasure19: json["strMeasure19"].toString(),
      strMeasure20: json["strMeasure20"].toString(),
      strSource: json["strSource"].toString(),
      strImageSource: json["strImageSource"].toString(),
      strCreativeCommonsConfirmed:
          json["strCreativeCommonsConfirmed"].toString(),
      dateModified: json["dateModified"].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        "idMeal": idMeal,
        "strMeal": strMeal,
        "strMealAlternate": strMealAlternate,
        "strCategory": strCategory,
        "strArea": strArea,
        "strCountry": strCountry,
        "strInstructions": strInstructions,
        "strMealThumb": strMealThumb,
        "strTags": strTags,
        "strYoutube": strYoutube,
        "strIngredient1": strIngredient1,
        "strIngredient2": strIngredient2,
        "strIngredient3": strIngredient3,
        "strIngredient4": strIngredient4,
        "strIngredient5": strIngredient5,
        "strIngredient6": strIngredient6,
        "strIngredient7": strIngredient7,
        "strIngredient8": strIngredient8,
        "strIngredient9": strIngredient9,
        "strIngredient10": strIngredient10,
        "strIngredient11": strIngredient11,
        "strIngredient12": strIngredient12,
        "strIngredient13": strIngredient13,
        "strIngredient14": strIngredient14,
        "strIngredient15": strIngredient15,
        "strIngredient16": strIngredient16,
        "strIngredient17": strIngredient17,
        "strIngredient18": strIngredient18,
        "strIngredient19": strIngredient19,
        "strIngredient20": strIngredient20,
        "strMeasure1": strMeasure1,
        "strMeasure2": strMeasure2,
        "strMeasure3": strMeasure3,
        "strMeasure4": strMeasure4,
        "strMeasure5": strMeasure5,
        "strMeasure6": strMeasure6,
        "strMeasure7": strMeasure7,
        "strMeasure8": strMeasure8,
        "strMeasure9": strMeasure9,
        "strMeasure10": strMeasure10,
        "strMeasure11": strMeasure11,
        "strMeasure12": strMeasure12,
        "strMeasure13": strMeasure13,
        "strMeasure14": strMeasure14,
        "strMeasure15": strMeasure15,
        "strMeasure16": strMeasure16,
        "strMeasure17": strMeasure17,
        "strMeasure18": strMeasure18,
        "strMeasure19": strMeasure19,
        "strMeasure20": strMeasure20,
        "strSource": strSource,
        "strImageSource": strImageSource,
        "strCreativeCommonsConfirmed": strCreativeCommonsConfirmed,
        "dateModified": dateModified,
      };
}
