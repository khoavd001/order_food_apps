
import 'package:get/get.dart';

import '../model/food_model.dart';

class FoodListStateController extends GetxController{
  var selectedFood = FoodModel(description: 'description',
      id: 'id',
      name: 'name',
      image: 'image',
      price: 0,
      size: [],
      addon: []).obs;

}