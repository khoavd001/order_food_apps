
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../strings/restaurant_home_strings.dart';

class HomeMenuWidget extends StatelessWidget {
  const HomeMenuWidget({
    Key? key,
    required this.zoomDrawerController,
  }) : super(key: key);

  final ZoomDrawerController zoomDrawerController;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: ()=> zoomDrawerController.toggle!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.home,color: Colors.white,),
            SizedBox(width: 30,),
            Text(homeText,
              style: GoogleFonts.jetBrainsMono(fontSize: 18,
                  color: Colors.white,fontWeight: FontWeight.w900
              ) ,)
          ],
        ),
      ),
    );
  }
}
