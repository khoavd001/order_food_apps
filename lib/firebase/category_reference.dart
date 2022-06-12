import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';

import '../const/const.dart';
import '../model/category_model.dart';

Future<List<CategoryModel>> getCategoryByRestaurantId(String restaurantId) async{
  var list = List<CategoryModel>.empty(growable:true);
  var source =
  await FirebaseDatabase.instance.reference()
      .child(RESTAURANT_REF)
      .child(restaurantId)
      .child(CATEGORY_REF)
      .once();

  Map<dynamic,dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(CategoryModel.fromJson(jsonDecode(jsonEncode(value))));
  });


  return list;

}