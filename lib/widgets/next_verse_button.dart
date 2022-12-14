import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';



import '../view_model/HomeScreen_View_modals/verse_no_provider.dart';
import '../view_model/HomeScreen_View_modals/Translation_data_view_modal.dart';
import '../view_model/HomeScreen_View_modals/chapterListviewModal.dart';

class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    final homeChapterListViewModalObj = Provider.of<HomeChapterListViewModel>(context);
    final translationDataViewModal = Provider.of<TranslationDataViewModal>(context);
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
          verseNoProvider.increaseVerseNo();
          translationDataViewModal.fetchTranslationDataByBothApi(homeChapterListViewModalObj.chapterNo??1,verseNoProvider.verseNo,);
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
