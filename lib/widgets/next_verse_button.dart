import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/translation_data_provider.dart';

import '../providers/verse_no_provider.dart';
import '../view_model/home_viewModal.dart';

class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    final homeChapterListViewModalObj = Provider.of<HomeChapterListViewModel>(context);
    final translationProviderObject = Provider.of<TranslationDataProvider>(context);
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
          verseNoProvider.increaseVerseNo();
          translationProviderObject.getData(verseNoProvider.verseNo,homeChapterListViewModalObj.chapterNo);
      },
      child: Container(alignment: Alignment.center,
       // width: screenWidth*(154/screenWidth),
        height: screenHeight*0.07,
        decoration:  BoxDecoration(
          color:  Color(0xff2B5BBB),
            borderRadius: const BorderRadius.all(Radius.circular(50
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
