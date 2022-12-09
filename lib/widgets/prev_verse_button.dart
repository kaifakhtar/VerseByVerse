import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/hadith_data_provider.dart';
import '../providers/verse_no_provider.dart';

class PrevVerseButton extends StatelessWidget {
  const PrevVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    final hadithData = Provider.of<HadithDataProvider>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        verseNoProvider.decreaseVerseNo();
        hadithData.getData(verseNoProvider.verseNo);
      },
      child: Container(
        alignment: Alignment.center,
        //width: screenWidth * (154 / screenWidth),
        height: screenHeight * 0.07,
        decoration:  BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(50)
            ),
           boxShadow: [
             BoxShadow(
               blurRadius: screenHeight*(5/800),
                 color: Color(0xffCACACA),
                 spreadRadius: screenHeight*(1/800)
             ),
           ]

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (47 / screenWidth)),
          child: Text(
            "Prev Verse",
            style: GoogleFonts.inter(
                fontSize: screenHeight * (16 / screenHeight),
                fontWeight: FontWeight.w500,
                color: const Color(0xff6C6C6C)),
          ),
        ),
      ),
    );
  }
}
