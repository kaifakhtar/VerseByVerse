import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/Features/Translation/presentation/widgets/ChapterListTile.dart';

import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';


class SelectChapterBottomSheet extends StatefulWidget {
  const SelectChapterBottomSheet({Key? key}) : super(key: key);

  @override
  State<SelectChapterBottomSheet> createState() => _SelectChapterBottomSheetState();
}

class _SelectChapterBottomSheetState extends State<SelectChapterBottomSheet> {

  @override
  Widget build(BuildContext context) {
    final hilaliAyahDataProvider = Provider.of<HilaliAyahDataProvider>(context,listen: false);

    final  chapterListAndDataProvider= Provider.of<ChapterListAndDataProvider>(context,listen: true);
    return SizedBox(
      height: 432.h,
      child: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16.h),
          child: Column(
            children: [
              Text("Select a chapter",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff4E576B),
                  fontSize: 24.sp
                ),
              ),
              SizedBox(height: 16.h,),
              Expanded(
                child: ListView.builder(
                    itemCount: chapterListAndDataProvider.chapterListDataEntity?.chapters?.length,
                    itemBuilder: (context,index){
                    return ChapterListTile(index);
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
