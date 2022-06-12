import 'dart:convert';


import 'package:firebase_database/firebase_database.dart';

import '../const/const.dart';
import '../model/popular_item_model.dart';

Future<List<PopularItemModel>> getBestDealByRestaurantId(String restaurantId) async{
  var list = List<PopularItemModel>.empty(growable:true);
  var source =
  await FirebaseDatabase.instance.reference()
      .child(RESTAURANT_REF)
      .child(restaurantId)
      .child(BEST_DEALS_REF)
      .once();

  Map<dynamic,dynamic> values = source.value;
  values.forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });


  return list;

}