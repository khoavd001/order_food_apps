
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/category_model.dart';
import '../state/category_state.dart';
import '../state/main_state.dart';
import '../view_model/category_vm/category_viewmodel_imp.dart';
import '../widgets/category/category_list_widget.dart';
import '../widgets/common/appbar_with_cart_widget.dart';

class CategoryScreen extends StatelessWidget {
  final viewModel = CategoryViewModelImp();
  final MainStateController mainStateController = Get.find();
  final CategoryStateController categoryStateController = Get.put(CategoryStateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithCartButton(title:'${mainStateController.selectedRestaurant.value}',),

      body:FutureBuilder(
        future: viewModel.displayCategoryByRestaurantId(
            mainStateController.selectedRestaurant.value.restaurantId),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child:CircularProgressIndicator(),
            );
          else{
            var lst = snapshot.data as List<CategoryModel>;

            return Container(
              margin: const EdgeInsets.only(top:10),
              child: CategoryListWidget(lst: lst,categoryStateController: categoryStateController,),
            );


          }
        },
      )
    );
  }
}

