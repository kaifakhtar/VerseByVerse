import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/modals/translation.dart';
import 'package:verse_by_verse/providers/hadith_data_provider.dart';
import 'package:verse_by_verse/providers/verse_no_provider.dart';
import 'package:verse_by_verse/services/remote_services.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  HadithDataProvider? hadith_data;


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    var screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    final verseNoProvider = Provider.of<VerseNoProvider>(context);
    var cardHeight = screenHeight * (630/800);
    var cardWidth = screenWidth * 0.9055;
     hadith_data = Provider.of<HadithDataProvider>(context);

     int verseCount =10;
    return Container(
      height: cardHeight,
      width: cardWidth,
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
                      "${hadith_data?.hadithData?.data?[0].surah?.number.toString()??"0"}:${hadith_data?.hadithData?.data?[0].numberInSurah?.toString()??"0"}",
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: cardHeight * 0.05079365,
                          color: const Color(0xff2B5BBB)),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xffDAE6FF),
                        borderRadius: BorderRadius.all(const Radius.circular(
                            50)),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: cardWidth * (10 / cardWidth),
                            vertical: cardWidth * (10 / cardWidth)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Translation",
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: cardHeight * (12 / cardHeight),
                                  color: const Color(0xff2B5BBB)),
                            ),
                            const Icon(
                                Icons.arrow_drop_down, color: Color(0xff2B5BBB))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardHeight * 0.025),
                Container(
                  width: screenWidth*(85/360),
                  height: screenHeight*(34/800),
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
                        hadith_data?.hadithData?.data![0].surah?.englishName??"No data",
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: cardHeight * (12 / cardHeight),
                            color: const Color(0xff2B5BBB)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: cardHeight * 0.025),
                Text(hadith_data?.hadithData?.data?[0].text.toString()??"Wait..."
                  , softWrap: true,
                  style: GoogleFonts.lora(
                      fontSize: cardHeight * (16 / cardHeight), height: 1.55),
                )


              ],
            ),
          ),
        ),
      ),
    );
  }
}