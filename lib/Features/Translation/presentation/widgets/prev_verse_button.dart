import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../utils/colors.dart';
import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';



class PrevVerseButton extends StatelessWidget {
  const PrevVerseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final hilaliAyahDataProvider =
    Provider.of<HilaliAyahDataProvider>(context, listen: true);
    final chapterListAndDataProvider =
    Provider.of<ChapterListAndDataProvider>(context, listen: true);


    return InkWell(
      onTap: () {

        if(hilaliAyahDataProvider.verseNo==1&&hilaliAyahDataProvider.chapterNo!=1){
          hilaliAyahDataProvider.chapterNo--;
          hilaliAyahDataProvider.verseNo=chapterListAndDataProvider.chapterListDataEntity!.chapters![hilaliAyahDataProvider.chapterNo - 1].versesCount!;
        }else if(hilaliAyahDataProvider.verseNo==1&&hilaliAyahDataProvider.chapterNo==1){

        }
        else {
          hilaliAyahDataProvider.decreaseVerseNo();
        }
      },
      child: Container(alignment: Alignment.center,
        // width: screenWidth*(154/screenWidth),
        height: 56.h,
        decoration:  BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(12.r
          )),

        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 34.5.w),
          child: Text("Prev Verse",
            style: GoogleFonts.poppins(fontSize:
            16.sp,
                fontWeight: FontWeight.w600,
                color: const Color(0xff6C6C6C)
            ),),
        ),
      ),
    );
  }
}
