import 'package:flutter/cupertino.dart';

class SizeModel{
  String name='';
  double price=0;

  SizeModel({required this.name, required this.price});

  SizeModel.fromJson(Map<String,dynamic>json){
    name = json['name'];
    price = double.parse(json['price'].toString());
  }

  Map<String,dynamic> toJson(){
    final data = Map<String,dynamic>();
    data['name']=this.name;
    data['price']=this.price;
    return data;
  }
}