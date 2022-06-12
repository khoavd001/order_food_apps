class RestaurantModel{
  String
         restaurantId='',
         address='',
         name='',
         imageUrl='',
         paymentURL='',
         phone='';

  RestaurantModel({
    required this.address,
    required this.name,
    required this.imageUrl,
    required this.paymentURL,
    required this.phone});

  RestaurantModel.fromJson(Map<String,dynamic> json){
    address = json['address'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    paymentURL = json['paymentURL'];
    phone = json['phone'];
  }

  Map<String,dynamic> toJson(){
    var data = Map<String,dynamic>();
    data['address'] = this.address;
    data['name'] = this.name;
    data['imageUrl'] = this.imageUrl;
    data['paymentURL'] = this.paymentURL;
    data['phone'] = this.phone;

    return data;
  }
}