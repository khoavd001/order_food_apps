import 'package:auto_animated/auto_animated.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/popular_item_model.dart';
import '../../state/main_state.dart';
import '../../strings/restaurant_home_strings.dart';
import '../../view_model/restaurant_home_detail_vm/restaurant_home_detail_vm.dart';
import '../common/common_widgets.dart';

class MostPopularWidget extends StatelessWidget {
  const MostPopularWidget({
    Key? key,
    required this.viewModel,
    required this.mainStateController,
  }) : super(key: key);

  final RestaurantHomeDetailViewModel viewModel;
  final MainStateController mainStateController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: viewModel.displayMostPopularByRestaurantId(
            mainStateController.selectedRestaurant.value.restaurantId),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator(),);
          else{
            var lstPopular = snapshot.data as List<PopularItemModel>;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(mostPopularText,
                  style: GoogleFonts.jetBrainsMono(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      color: Colors.black45),

                ),
                Expanded(child: LiveList(
                    showItemDuration: Duration(milliseconds: 350),
                    showItemInterval: Duration(milliseconds: 150),
                    reAnimateOnVisibility: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: lstPopular.length,
                    itemBuilder: animationItemBuilder((index)=> Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(lstPopular[index].image),
                          minRadius: 30,
                          maxRadius: 50,
                        ),
                        SizedBox(height: 10,),
                        Text(lstPopular[index].name,
                          style: GoogleFonts.jetBrainsMono(),
                        )
                      ],),
                    ),)
                ),)
              ],);
          }
        },
      ),);
  }
}
