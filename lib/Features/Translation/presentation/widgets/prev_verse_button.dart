import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../manager/ChapterAndVerse_SharedPref_provider.dart';
import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import '../manager/theme_changer.dart';



class PrevVerseButton extends StatelessWidget {
  const PrevVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hilaliAyahDataProvider =
    Provider.of<HilaliAyahDataProvider>(context, listen: true);
    final chapterListAndDataProvider =
    Provider.of<ChapterListAndDataProvider>(context, listen: true);
    final themeChanger=Provider.of<ThemeChanger>(context);
    final chapterAndVerse_SharedPref_provider =
    Provider.of<ChapterAndVerse_SharedPref_provider>(context, listen: true);
    return InkWell(
      onTap: () {
        if(hilaliAyahDataProvider.verseNo==1&&hilaliAyahDataProvider.chapterNo!=1){
          hilaliAyahDataProvider.decrementChapterBy1();
          hilaliAyahDataProvider.setSpecificVerse(verse: chapterListAndDataProvider.chapterListDataEntity!.chapters![hilaliAyahDataProvider.chapterNo - 1].versesCount!);
          chapterAndVerse_SharedPref_provider.saveChAndVerseFromSharedPref(chapterNo: hilaliAyahDataProvider.chapterNo, verseNo: hilaliAyahDataProvider.verseNo);
        }else if(hilaliAyahDataProvider.verseNo==1&&hilaliAyahDataProvider.chapterNo==1){

        }
        else {
          hilaliAyahDataProvider.decrementVerseBy1();
          chapterAndVerse_SharedPref_provider.saveChAndVerseFromSharedPref(chapterNo: hilaliAyahDataProvider.chapterNo, verseNo: hilaliAyahDataProvider.verseNo);
        }
      },
      child: Ink(//alignment: Alignment.center,
        // width: screenWidth*(154/screenWidth),
        height: 56.h,
        decoration:  BoxDecoration(
          color: themeChanger.isDark?Colors.white.withOpacity(.87):Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.r
          )),

        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal:40.w),
            child: Text("Prev Ayah",
              style: GoogleFonts.poppins(fontSize:
              16.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff6C6C6C)
              ),),
          ),
        ),
      ),
    );
  }
}
