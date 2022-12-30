import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/utils/colors.dart';

import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';

class ChapterListTile extends StatelessWidget {
  int index;

  ChapterListTile(this.index);

  @override
  Widget build(BuildContext context) {
    final chapterListAndDataProvider =
        Provider.of<ChapterListAndDataProvider>(context, listen: true);
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        hilaliAyahDataProvider.changeChapterAndResetVerseTo1(chapter: index + 1);
        //hilaliAyahDataProvider.verseNo=1;
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        //height: 62.h,
        decoration: BoxDecoration(
            color: (hilaliAyahDataProvider.chapterNo == index + 1)
                ? Color(0xffC9FFDB)
                : Color(0xffDAE6FF),
            borderRadius: BorderRadius.all(Radius.circular(20.r))),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(7.r))),
                    child: Text(
                      (index + 1).toString(),
                      style: GoogleFonts.poppins(
                          color: AppColors.blueColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chapterListAndDataProvider.chapterListDataEntity
                                ?.chapters?[index].nameSimple ??
                            "No data",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blueColor),
                      ),
                      Text(
                        chapterListAndDataProvider.chapterListDataEntity
                                ?.chapters?[index].nameArabic ??
                            "No data",
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blueColor),
                      )
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.center,
                width: 76.w,
                height: 28.h,
                decoration: BoxDecoration(
                    color: Color(0xff22B152),
                    borderRadius: BorderRadius.all(Radius.circular(12.sp))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Text(
                    "Verses : ${chapterListAndDataProvider.chapterListDataEntity?.chapters?[index].versesCount}",
                    style: GoogleFonts.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
