import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/const.dart';
import '../../model/category_model.dart';
import '../../screens/food_list.dart';
import '../../state/category_state.dart';
import '../common/common_widgets.dart';

class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.lst,
    required this.categoryStateController
  }) : super(key: key);

  final List<CategoryModel> lst;
  final CategoryStateController categoryStateController;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: LiveGrid(
            showItemInterval: Duration(milliseconds: 300),
            showItemDuration: Duration(milliseconds: 300),
            reAnimateOnVisibility: true,
            itemCount: lst.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,crossAxisSpacing: 1,mainAxisSpacing: 1
            ),
            itemBuilder: animationItemBuilder((index)=>InkWell(
              onTap: (){
                categoryStateController.selectedCategory.value = lst[index];
                Get.to(()=> FoodListScreen());
              },
              child:  Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: lst[index].image,
                        fit: BoxFit.cover,
                        errorWidget: (context,url,err)=>Center(child: Icon(Icons.image),),

                        progressIndicatorBuilder: (context,url,downloadProgress) => Center(child: CircularProgressIndicator(),
                        ),
                      ),
                      Container(color: Color(COLOR_OVERLAY),),
                      Center(child: Text(
                          '${lst[index].name}',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.jetBrainsMono(
                              color:Colors.white,
                              fontSize: 18
                          )
                      ),)
                    ],
                  )
              ),
            )),
          )
      ),
    ],);
  }
}
