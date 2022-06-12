

import 'food_model.dart';

class CartModel extends FoodModel{
  int quantity = 0;
  String restaurantId='';
  String userUid = '';

  CartModel({

    id,
    name,
    image,
    price,
    size,
    addon,
    description,
    required this.quantity,
    required this.restaurantId,
    required this.userUid
})
    :super(
    id:id,
    name:name,
    image:image,
    price:price,
    size:size,
    addon:addon,
    description:description,
  );

  factory CartModel.fromJson(Map<String,dynamic>json){
    final food = FoodModel.fromJson(json);
    final quantity = json['quantity'];
    final restaurantId = json['restaurantId'];
    final userUid = json['userUid'];
    return CartModel(
      id:food.id,
      image: food.image,
      price: food.price,
      name: food.name,
      addon: food.addon,
      size: food.size,
      description: food.description,
      quantity: quantity,
      restaurantId: restaurantId,
      userUid: userUid
    );

    }

  Map<String,dynamic> toJson(){
    final data = Map<String,dynamic>();
    data['name']=this.name;
    data['price']=this.price;
    data['id']=this.id;
    data['description']=this.description;
    data['image']=this.image;
    data['size']=this.size.map((v) => v.toJson()).toList();
    data['addon']=this.addon.map((v) => v.toJson()).toList();
    data['quantity'] = this.quantity;
    data['restaurantId'] = this.restaurantId;
    data['userUid'] = this.userUid;

    return data;
  }

}