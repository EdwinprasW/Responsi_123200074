class ListFoodModel {
  bool? success;
  String? message;
  Data? data;

  ListFoodModel({this.success, this.message, this.data});

  ListFoodModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? link;
  String? description;
  String? title;
  String? image;
  List<Meals>? meals;

  Data({this.link, this.description, this.title, this.image, this.meals});

  Data.fromJson(Map<String, dynamic> json) {
    link = json['link'];
    description = json['description'];
    title = json['title'];
    image = json['image'];
    if (json['meals'] != null) {
      meals = <Meals>[];
      json['meals'].forEach((v) {
        meals!.add(Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['link'] = link;
    data['description'] = description;
    data['title'] = title;
    data['image'] = image;
    if (meals != null) {
      data['meals'] = meals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class Meals {
  String? idMeal;
  String? strMeal;
  String? strCategory;
  String? strArea;
  String? strYoutube;
  String? strInstructions;
  String? strMealThumb;
  String? type;

  Meals({this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strYoutube,
    this.strInstructions,
    this.strMealThumb,
    this.type});

  Meals.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strYoutube = json['strYoutube'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = idMeal;
    data['strMeal'] = strMeal;
    data['strCategory'] = strCategory;
    data['strArea'] = strArea;
    data['strYoutube'] = strYoutube;
    data['strInstructions'] = strInstructions;
    data['strMealThumb'] = strMealThumb;
    data['type'] = type;
    return data;
  }


}

