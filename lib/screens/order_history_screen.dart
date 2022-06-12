import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../state/main_state.dart';
import '../strings/main_strings.dart';
import '../utils/const.dart';
import '../view_model/order_history_vm/order_history_view_model_imp.dart';
import '../widgets/order_history/order_history_widget.dart';

class OrderHistory extends StatelessWidget {
  final vm = new OrderHisToryViewModelImp();
  final MainStateController mainStateController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(length: 3,
          child:  Scaffold(
            appBar: AppBar(
              title: Text(orderHistoryText),
              bottom: TabBar(tabs: [
                Tab(icon: Icon(Icons.cancel)),
                Tab(icon: Icon(Icons.refresh)),
                Tab(icon: Icon(Icons.check)),
              ],),
            ),
            body:  TabBarView(
              children: [
                OrderHistoryWidget(vm, mainStateController, ORDER_CANCELLED),
                OrderHistoryWidget(vm, mainStateController, ORDER_PROCESSING),
                OrderHistoryWidget(vm, mainStateController, ORDER_SHIPPED),

              ],
            ),
          ),
        ));
  }
}
