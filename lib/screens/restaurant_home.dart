
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:order_food_apps/screens/restaurant_home_detail.dart';

import 'menu.dart';

class RestaurantHome extends StatelessWidget {
  final drawerZoomController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      body: ZoomDrawer(
        controller: drawerZoomController,
        menuScreen: MenuScreen(drawerZoomController),
        mainScreen: RestaurantHomeDetail(drawerZoomController),
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        menuBackgroundColor: Colors.grey[300]!,
        slideWidth: MediaQuery.of(context).size.width*0.65,
        openCurve: Curves.bounceInOut,
        closeCurve: Curves.ease,
      ),
    ));

  }

}

