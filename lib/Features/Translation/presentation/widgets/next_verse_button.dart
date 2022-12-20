import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/utils/colors.dart';



class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;

    return InkWell(
      onTap: (){
         },
      child: Container(alignment: Alignment.center,
       // width: screenWidth*(154/screenWidth),
        height: screenHeight*0.07,
        decoration:  const BoxDecoration(
          color:  AppColors.blueColor,
            borderRadius: BorderRadius.all(Radius.circular(50
            )),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (40 / 360)),
          child: Text("Next Verse",
          style: GoogleFonts.poppins(fontSize:
          screenHeight*(16/screenHeight),
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFF3F3)
          ),),
        ),
      ),
    );
  }
}
