import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:verse_by_verse/Features/Translation/presentation/pages/Home.dart';
import 'package:verse_by_verse/utils/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>Home()));

    });
  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    return  Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120.h,),
            Container(
              height: 272.h,
              width: 272.w,
              child: Image.asset('asset/final_icon_vbv.png'),
            ),
            SizedBox(height: 44.h,),
            GradientText(
              'VerseByVerse : Quran',
              style: GoogleFonts.poppins(
                fontSize: 28.sp,
                fontWeight: FontWeight.w700
              ),
              colors: [
                AppColors.blueColor,
                Color(0xff22B152)
              ],
            ),
            SizedBox(height: 132.h,),
            RichText(text: TextSpan(
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                color: Color(0xff737373),
                fontWeight: FontWeight.w600
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "Learn "
                ),
                TextSpan(
                    text: "The Quran",
                  style: GoogleFonts.poppins(
                      fontSize: 24.sp,
                      color: Color(0xff22B152)
                  ),
                ),
              ]
            )),
            RichText(text: TextSpan(
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Color(0xff737373),
                    fontWeight: FontWeight.w600
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: "without "
                  ),
                  TextSpan(
                    text: "distractions",
                    style: GoogleFonts.poppins(
                        fontSize: 20.sp,
                        color: AppColors.blueColor
                    ),
                  ),
                ]
            )),
          ],
        ),
      ),
    );
  }
}
