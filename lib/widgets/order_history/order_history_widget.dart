
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/order_model.dart';
import '../../state/main_state.dart';
import '../../strings/order_history_string.dart';
import '../../view_model/order_history_vm/order_history_view_model_imp.dart';
import 'order_history_list_widget.dart';

class OrderHistoryWidget extends StatelessWidget {
  final OrderHisToryViewModelImp vm= new OrderHisToryViewModelImp();
   final MainStateController mainStateController= new MainStateController();
   final String orderStatusMode;

  OrderHistoryWidget(vm, mainStateController, this.orderStatusMode);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FutureBuilder(
        future: vm.getUserHistory(
            mainStateController.selectedRestaurant.value.restaurantId,
            orderStatusMode),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var lst = snapshot.data as List<OrderModel>;

            if (lst.length == 0) {
              return Center(
                child: Text(emptyText),
              );
            }
            return Container(
              margin: const EdgeInsets.only(top:10),
              child: OrderHistoryListWidget(lst: lst),
            );
          }
        },
      ),
    );
  }
}
