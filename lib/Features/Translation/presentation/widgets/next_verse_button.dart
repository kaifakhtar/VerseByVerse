import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/utils/colors.dart';

import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';



class NextVerseButton extends StatelessWidget {
  const NextVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hilaliAyahDataProvider =
    Provider.of<HilaliAyahDataProvider>(context, listen: true);
    final chapterListAndDataProvider =
    Provider.of<ChapterListAndDataProvider>(context, listen: true);

    return InkWell(
      onTap: (){
        if(hilaliAyahDataProvider.verseNo >= chapterListAndDataProvider.chapterListDataEntity!.chapters![hilaliAyahDataProvider.chapterNo - 1].versesCount!.toInt()){
          hilaliAyahDataProvider.changeChapter(chapterNumber: hilaliAyahDataProvider.chapterNo+1);
        }
        else {
          hilaliAyahDataProvider.increaseVerseNo(); // condition check
        }
         },
      child: Container(alignment: Alignment.center,
       // width: screenWidth*(154/screenWidth),
        height: 56.h,
        decoration:  BoxDecoration(
          color:  AppColors.blueColor,
            borderRadius: BorderRadius.all(Radius.circular(12.r
            )),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.5.w),
          child: Text("Next Verse",
          style: GoogleFonts.poppins(fontSize:
          16.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xffFFF3F3)
          ),),
        ),
      ),
    );
  }
}
