import 'package:flutter/cupertino.dart';

abstract class MenuViewModel{
  void navigateCategories();
  void backToRestaurantList();
  bool checkLoginState(BuildContext context);
  void login(BuildContext context);
  void logout(BuildContext context);
  void navigationHome(BuildContext context);
  void navigateCart();
  void viewOrderHistory(BuildContext context);
}