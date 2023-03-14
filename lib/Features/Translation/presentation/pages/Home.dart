import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:verse_by_verse/utils/colors.dart';

import '../manager/ChapterAndVerse_SharedPref_provider.dart';
import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import '../manager/theme_changer.dart';
import '../widgets/next_verse_button.dart';
import '../widgets/popUpmenu.dart';
import '../widgets/prev_verse_button.dart';
import '../widgets/verse_card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoaded = true;
  bool hasInternet = false;

  @override
  Widget build(BuildContext context) {
    final hilaliAyahDataProvider =
    Provider.of<HilaliAyahDataProvider>(context, listen: true);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    final themeChanger = Provider.of<ThemeChanger>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: themeChanger.isDark ? Color(0xff121212) : Color(
            0xffE8EBF3),
        appBar: AppBar(
          systemOverlayStyle:
          SystemUiOverlayStyle(statusBarColor: AppColors.blueColor),
          elevation: 2.h,
          title: Text(
            "VerseByVerse",
            style: GoogleFonts.poppins(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: themeChanger.isDark ? Color(0xff499CF2) : Colors.white
            ),
          ),
          backgroundColor: themeChanger.isDark ? Color(0xff272727) : Color(
              0xff2B5BBB),
          actions: [
            // IconButton(onPressed: () {
            //   themeChanger.toggleTheme();
            // }, icon: Icon(Icons.sunny,
            //   color: themeChanger.isDark
            //       ? Colors.white.withOpacity(.87)
            //       : Colors.white,)),
            PopUp(),


          ],
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                await Share.share(''
                    'Check this amazing app, where we can learn Quran easily and understand the meanings without any distractions'
                    '\n\nhttps://play.google.com/store/apps/details?id=com.sparkbrightest.versebyverse');
              },
              child: Container(
                height: 28.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: themeChanger.isDark ? Color(0xff1e1e1e) : Color(
                        0xffFFF9E7)),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Be a part of continuous charity",
                        style: GoogleFonts.poppins(
                            color: themeChanger.isDark ? Color(0xffFFE5BF)
                                .withOpacity(.87) : Color(0xff4C3801),
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 18.h,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Share",
                              style: GoogleFonts.poppins(
                                  fontSize: 12.sp,
                                  color: themeChanger.isDark ? Color(0xffFFE5BF)
                                      .withOpacity(.87) : Color(0xff43609b),
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Icon(
                              Icons.share,
                              size: 12.h,
                              color: themeChanger.isDark ? Color(0xffFFE5BF)
                                  .withOpacity(.87) : AppColors.blueColor,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  VerseCard(),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PrevVerseButton(),
                      NextVerseButton(),
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }

  Future<void> errorDialog(BuildContext context) async {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) =>
          Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.r))),
            child: Container(
              height: 142.h,
              width: 138.w,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xffFEE8D8),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                          topRight: Radius.circular(12.r)),
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
                            "Uh! Some error occured",
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
                    padding: EdgeInsets.symmetric(horizontal: 34.w),
                    child: Text(
                      "Try checking your internet connection,\n Turn it on and restart the app",
                      textAlign: TextAlign.center,
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final hilaliAyahDataProvider =
      Provider.of<HilaliAyahDataProvider>(context, listen: false);
      final chapterAndVerse_SharedPref_provider =
      Provider.of<ChapterAndVerse_SharedPref_provider>(context,
          listen: false);


      await chapterAndVerse_SharedPref_provider.getChAndVerseFromSharedPref();
      print("chapProvider chapter${chapterAndVerse_SharedPref_provider
          .chapterNo}");
      // get ch and ver from shared pref and assign it to the main provider
      hilaliAyahDataProvider.setChapterAndVerseFromSharedPref(
          chapterAndVerse_SharedPref_provider.chapterNo,
          chapterAndVerse_SharedPref_provider.verseNo);
      // print("hilali ch and ver are down");
      // print(hilaliAyahDataProvider.chapterNo);
      // print(hilaliAyahDataProvider.verseNo);
      final chapterListAndDataProvider =
      Provider.of<ChapterListAndDataProvider>(context, listen: false);
      chapterListAndDataProvider.getchapterListDataEntity();

      hilaliAyahDataProvider.getHilaliAyahDataEntity();
      // if(hilaliAyahDataProvider.isFailureEntity){
      //   errorDialog(context);
      // }


      //if( hilaliAyahDataProvider.isFailureEntity){ errorDialog(context);}


    });
  }
}
