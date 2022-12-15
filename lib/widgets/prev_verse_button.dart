import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


import '../view_model/HomeScreen_View_modals/verse_no_provider.dart';
import '../view_model/HomeScreen_View_modals/Translation_data_view_modal.dart';
import '../view_model/HomeScreen_View_modals/chapterListviewModal.dart';

class PrevVerseButton extends StatelessWidget {
  const PrevVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    final translationProviderObject = Provider.of<TranslationDataViewModal>(context);
    final homeChapterListViewModalObj = Provider.of<HomeChapterListViewModel>(context);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        verseNoProvider.decreaseVerseNo();
        translationProviderObject.fetchTranslationDataByBothApi(homeChapterListViewModalObj.chapterNo??1,verseNoProvider.verseNo,);
      },
      child: Container(
        alignment: Alignment.center,
        //width: screenWidth * (154 / screenWidth),
        height: screenHeight * 0.07,
        decoration:  BoxDecoration(
            color: Color(0xffFFFFFF),
            borderRadius: const BorderRadius.all(Radius.circular(50)
            ),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * (40 / 360)),
          child: Text(
            "Prev Verse",
            style: GoogleFonts.poppins(
                fontSize: screenHeight * (16 / screenHeight),
                fontWeight: FontWeight.w500,
                color: const Color(0xff6C6C6C)),
          ),
        ),
      ),
    );
  }
}
