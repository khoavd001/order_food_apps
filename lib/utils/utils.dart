
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

final currencyFormat = NumberFormat.simpleCurrency();

double foodDetailImageAreaSize(BuildContext context){
  return MediaQuery.of(context).size.height/3;
}

double calculateFinalPayment(double subTotal,double discount){
  return subTotal - (subTotal*(discount/100));
}
int createOrderNumber(int original){
  return original + new Random().nextInt(1000);
}

String convertToDate(int date) => DateFormat('dd-MM-yyyy HH:mm')
    .format(DateTime.fromMillisecondsSinceEpoch(date));

String convertStatus(int status) => status == 0
    ? 'Placed'
    : status ==1 ?
        'Shipping'
            : status == 2
               ? 'Shipped'
               :'Cancelled';