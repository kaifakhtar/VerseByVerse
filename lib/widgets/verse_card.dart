import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/data/response/status.dart';
import 'package:verse_by_verse/modals/translation.dart';
//import 'package:verse_by_verse/providers/translation_data_provider.dart';
import 'package:verse_by_verse/view_model/HomeScreen_View_modals/verse_no_provider.dart';

import 'package:verse_by_verse/view_model/HomeScreen_View_modals/Translation_data_view_modal.dart';
import 'package:verse_by_verse/view_model/HomeScreen_View_modals/chapterListviewModal.dart';
import 'package:verse_by_verse/widgets/shimmer_loading.dart';

import 'drop_down_for_chapters.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  TranslationDataViewModal? translationDataViewModal;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final homeChapterListViewModalObj = Provider.of<HomeChapterListViewModel>(context);
    var cardHeight = screenHeight * (630 / 800);
    var cardWidth = screenWidth * 0.9055;
    translationDataViewModal = Provider.of<TranslationDataViewModal>(context);
    final verseNoProviderObj = Provider.of<VerseNoProvider>(context);

    return Container(
      height: cardHeight,
      //width: cardWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardHeight * 0.047619),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: cardWidth * (20 / cardWidth),
              vertical: cardHeight * (24 / cardHeight)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${homeChapterListViewModalObj.chapterNo?? "0"}:${verseNoProviderObj.verseNo}",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: cardHeight * 0.05079365,
                          color: const Color(0xff2B5BBB)),
                    ),
                    Container(
                      //width: screenWidth * (85 / 360),
                      height: screenHeight * (34 / 800),
                      decoration: const BoxDecoration(
                        color: Color(0xffDAE6FF),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: cardWidth * (10 / cardWidth),
                              vertical: cardWidth * (10 / cardWidth)),
                          child: const ChaptersDropdown(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardHeight * 0.025),
                Container(
                  width: screenWidth * (85 / 360),
                  height: screenHeight * (34 / 800),
                  decoration: const BoxDecoration(
                    color: Color(0xffDAE6FF),
                    borderRadius: const BorderRadius.all(Radius.circular(50)), //TODO: change this to relative format
                  ),
                  child: FittedBox(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: cardWidth * (10 / cardWidth),
                          vertical: cardWidth * (10 / cardWidth)),
                      child: Text(
                            "Hilali",
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: cardHeight * (12 / cardHeight),
                            color: const Color(0xff2B5BBB)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: cardHeight * (40/cardHeight)),

                translationDataViewModal?.translationDataResponse.status==Status.LOADING?ShimmerEffect():Text(
                  translationDataViewModal?.translationDataResponse.data?.data?[0].text.toString() ??
                      "No data",
                  softWrap: true,
                  style: GoogleFonts.literata(fontWeight: FontWeight.w500,
                     color: const Color(0xff515151),
                     fontSize: cardHeight * (20 / cardHeight), height: 1.55),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
