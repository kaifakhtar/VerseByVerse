import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PopUp extends StatelessWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

      onSelected: (value){
        if(value==items.info){
          errorDialog(context);
        }
      },
        itemBuilder: (context) =>
        [
          // PopupMenuItem(
          //   child: Row(
          //     children: const [
          //       Text("Favorites"),
          //     ],
          //   ),
          // ),
          PopupMenuItem(
            value: items.info,
              child: Row(
                children: const [
                  Text("Info"),
                ],
              ))
        ]);
  }


  Future errorDialog(BuildContext context)  {
    return showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.r))),
        child: Container(
          height: 192.h,
          width: 138.w,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xffFEE8D8),
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(12.r),topRight: Radius.circular(12.r)),
                ),
                height: 52.h,
                child: Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 24.h,
                        color: Color(0xffDD2F38),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "Translation Info.",
                        style: GoogleFonts.poppins(
                            fontSize: 16.sp, color: Color(0xffDD2F38),
                            fontWeight: FontWeight.w500
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                height: 0,
                thickness: 1.h,
                color: Color(0xffDD2F38),
              ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 34.w),
                child: Text(
                  "Translation of the Quran meanings into English,\nTaqi-ud-Din Al-Hilali and Muhsen Khan\nVersion : 2019-12-27 - V1.1.0\nSource:www.quranenc.com",
                  //textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(color: Color(0xff636363),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500
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
enum items{
info
}