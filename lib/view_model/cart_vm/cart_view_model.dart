
import 'package:flutter/material.dart';

import '../../model/cart_model.dart';
import '../../state/cart_state.dart';

abstract class CartViewModel{
  void updateCart(CartStateController controller,String restaurantId, int index,int value);
  void deleteCart(CartStateController controller,String restaurantId, int index);
  void clearCart(CartStateController controller);

  processCheckout(BuildContext context, List<CartModel> cart);

  }