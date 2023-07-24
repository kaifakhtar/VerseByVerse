import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/utils/colors.dart';

import '../manager/ChapterAndVerse_SharedPref_provider.dart';
import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import '../manager/theme_changer.dart';

class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: true);
    final chapterListAndDataProvider =
        Provider.of<ChapterListAndDataProvider>(context, listen: true);
    final chapterAndVerse_SharedPref_provider =
        Provider.of<ChapterAndVerse_SharedPref_provider>(context, listen: true);

    return InkWell(
      onTap: () {
        // edge case 114

        if (hilaliAyahDataProvider.verseNo >=
            chapterListAndDataProvider.chapterListDataEntity!
                .chapters![hilaliAyahDataProvider.chapterNo - 1].versesCount!
                .toInt()) {
          hilaliAyahDataProvider.changeChapterAndResetVerseTo1(
              chapter: hilaliAyahDataProvider.chapterNo + 1);
        } else {
          hilaliAyahDataProvider.incrementVerseBy1();
          chapterAndVerse_SharedPref_provider.saveChAndVerseFromSharedPref(
              chapterNo: hilaliAyahDataProvider.chapterNo,
              verseNo: hilaliAyahDataProvider.verseNo); // condition check
        }
      },
      child: Ink(
        //alignment: Alignment.center,
        // width: screenWidth*(154/screenWidth),
        height: 56.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // begin: Alignment.bottomLeft,
            // end: Alignment.topRight,
            stops: [.5, 1],
            colors: [
              themeChanger.isDark ? Color(0xff499CF2) : AppColors.blueColor,
              themeChanger.isDark ? Color(0xff9BD7A8) : Color(0xff22B152),
            ],
          ),
          //color:  AppColors.blueColor,
          borderRadius: BorderRadius.all(Radius.circular(12.r)),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              "Next ayah",
              style: GoogleFonts.poppins(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: themeChanger.isDark
                      ? Color(0xff222222).withOpacity(0.8)
                      : Color(0xffFFF3F3)),
            ),
          ),
        ),
      ),
    );
  }
}
