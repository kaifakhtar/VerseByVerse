import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/modals/translation.dart';
import 'package:verse_by_verse/providers/translation_data_provider.dart';
import 'package:verse_by_verse/providers/verse_no_provider.dart';
import 'package:verse_by_verse/services/remote_services.dart';

import '../providers/list_of_chapter_provider.dart';
import 'drop_down_for_chapters.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  TranslationDataProvider? hadith_data;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final listOfChapterProviderObj = Provider.of<ListOfChapterProvider>(context);
    var cardHeight = screenHeight * (630 / 800);
    var cardWidth = screenWidth * 0.9055;
    hadith_data = Provider.of<TranslationDataProvider>(context);
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
                      "${listOfChapterProviderObj.chapterNo?? "0"}:${verseNoProviderObj.verseNo}",
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
                          child: ChaptersDropdown(),
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
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                Text(
                  hadith_data?.hadithData?.data?[0].text.toString() ??
                      "Loading...",
                  softWrap: true,
                  style: GoogleFonts.literata(fontWeight: FontWeight.w500,
                     color: Color(0xff515151),
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
