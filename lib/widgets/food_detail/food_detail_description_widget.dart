
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../state/food_list_state.dart';

class FoodDetailDescriptionWidget extends StatelessWidget {
  const FoodDetailDescriptionWidget({
    Key? key,
    required this.foodListStateController,
  }) : super(key: key);

  final FoodListStateController foodListStateController;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemBuilder: (context,_){
                  return Icon(Icons.star,color:Colors.amber);
                },
                onRatingUpdate: (value) {}),
            SizedBox(
              height: 10,),
            Text(
              '${foodListStateController.selectedFood.value.description}',
              style: GoogleFonts.jetBrainsMono(
                color:Colors.blueGrey,
                fontSize: 14,

              ),
            ),
          ],
        ),
      ),
    );
  }
}


