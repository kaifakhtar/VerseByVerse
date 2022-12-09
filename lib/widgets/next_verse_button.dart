import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/hadith_data_provider.dart';
import '../providers/verse_no_provider.dart';

class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    final hadithData = Provider.of<HadithDataProvider>(context);
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
          verseNoProvider.increaseVerseNo();
          hadithData.getData(verseNoProvider.verseNo);
      },
      child: Container(alignment: Alignment.center,
       // width: screenWidth*(154/screenWidth),
        height: screenHeight*0.07,
        decoration:  BoxDecoration(
          color:  Color(0xff2B5BBB),
            borderRadius: const BorderRadius.all(Radius.circular(50
            )),
            boxShadow: [
              BoxShadow(
                  blurRadius:screenHeight*(5/800),
                  color: Color(0xff92B6FF),
                  spreadRadius: screenWidth*(1/360)
              ),
            ]
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * (47 / screenWidth)),
          child: Text("Next Verse",
          style: GoogleFonts.inter(fontSize:
          screenHeight*(16/screenHeight),
              fontWeight: FontWeight.w500,
              color: const Color(0xffFFF3F3)
          ),),
        ),
      ),
    );
  }
}
