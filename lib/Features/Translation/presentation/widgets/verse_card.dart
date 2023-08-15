import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verse_by_verse/Features/Translation/presentation/widgets/reciters_drop_down.dart';
import 'package:verse_by_verse/Features/Translation/presentation/widgets/shimmer_loading.dart';

import '../../../../utils/colors.dart';
import '../manager/ChapterAndVerse_SharedPref_provider.dart';
import '../manager/ChapterListAndDataProvider.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import '../manager/theme_changer.dart';
import 'SelectChapterBottomSheet.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  late TextEditingController verseEditingController;
  final ScrollController scrollController = ScrollController();
//
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verseEditingController = TextEditingController();
  }

  @override
  void dispose() async {
    // TODO: implement dispose
    super.dispose();

    verseEditingController.dispose();
  }

  @override
  Container build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final chapterListAndDataProvider =
        Provider.of<ChapterListAndDataProvider>(context, listen: true);
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: true);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    //final checkerTranslationNameViewModal = Provider.of<CheckerTranslationNameViewModal>(context);
    var cardHeight = screenHeight * (600 / 800);
    //hilaliTranslationDataViewModal = Provider.of<HilaliTranslationDataViewModal>(context);

    return Container(
      height: cardHeight,
      //width: cardWidth,
      child: Card(
        color: themeChanger.isDark ? Color(0xff1e1e1e) : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 12.w, vertical: cardHeight * (24 / cardHeight)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${hilaliAyahDataProvider.chapterNo}:${hilaliAyahDataProvider.verseNo}",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 24.sp,
                        color: themeChanger.isDark
                            ? Color(0xff499CF2)
                            : Color(0xff2B5BBB)),
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          barrierColor: Colors.black.withOpacity(.35),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          builder: (BuildContext context) {
                            return SelectChapterBottomSheet();
                          });
                    },
                    child: Row(
                      children: [
                        Ink(
                          //width: 100.w,
                          // height: 40.h,
                          decoration: BoxDecoration(
                            color: themeChanger.isDark
                                ? Color(0xff1e1e1e)
                                : Color(0xffDAE6FF),
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.r)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            child: Row(
                              children: [
                                Text(
                                  chapterListAndDataProvider
                                          .chapterListDataEntity
                                          ?.chapters?[
                                              hilaliAyahDataProvider.chapterNo -
                                                  1]
                                          .nameSimple ??
                                      "No data",
                                  style: GoogleFonts.poppins(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600,
                                      color: themeChanger.isDark
                                          ? Color(0xff499CF2)
                                          : Color(0xff2B5BBB)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Icon(Icons.keyboard_arrow_down,
                                    size: 20.h,
                                    color: themeChanger.isDark
                                        ? Color(0xff499CF2)
                                        : Color(0xff2B5BBB)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        InkWell(
                          onTap: () async {
                            String? inputVerseNo = await openVerseInputDialog(
                                context,
                                chapterListAndDataProvider
                                    .chapterListDataEntity!
                                    .chapters![
                                        hilaliAyahDataProvider.chapterNo - 1]
                                    .versesCount!
                                    .toInt());
                            if (inputVerseNo == null || inputVerseNo.isEmpty) {
                              return;
                            }
                            if (int.parse(inputVerseNo) <=
                                    chapterListAndDataProvider
                                        .chapterListDataEntity!
                                        .chapters![
                                            hilaliAyahDataProvider.chapterNo -
                                                1]
                                        .versesCount!
                                        .toInt() &&
                                int.parse(inputVerseNo) > 0) {
                              hilaliAyahDataProvider.setSpecificVerse(
                                  verse: int.parse(inputVerseNo));
                            }
                            verseEditingController.text = "";
                          },
                          child: Ink(
                            // alignment: Alignment.center,
                            //width: screenWidth * (85 / 360),
                            //height: screenHeight * (34 / 800),
                            decoration: BoxDecoration(
                              color: themeChanger.isDark
                                  ? Color(0xff1e1e1e)
                                  : Color(0xffDAE6FF),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 8.h),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.search,
                                      size: 16.h,
                                      color: AppColors.blueColor,
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Text(
                                      "Ayah",
                                      style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                          color: themeChanger.isDark
                                              ? Color(0xff499CF2)
                                              : Color(0xff2B5BBB)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              hilaliAyahDataProvider.isLoading
                  ? const ShimmerEffect()
                  : Expanded(
                      child: Scrollbar(
                        controller: scrollController,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.only(top: 4.h),
                            child: Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: themeChanger.isDark
                                          ? Color(0xff252525)
                                          : Color(0xffCFEED9),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //       color: Colors.grey,
                                      //       blurRadius: 4.0,
                                      //       offset: Offset(0, 0)),
                                      // ],
                                      // border: Border.all(
                                      //     color: themeChanger.isDark
                                      //         ? Color(0xff252525)
                                      //         : Color(0xff22B152)
                                      //             .withOpacity(.5)),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(12.r))),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {
                                            _copyToClipboard();
                                          },
                                          style: OutlinedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          child: Icon(
                                            Icons.copy,
                                            color: Colors.black38,
                                            size: 16
                                                .r, // Adjust the icon size as needed
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          child: Text(
                                            hilaliAyahDataProvider
                                                    .ayahDataHilaliEntity
                                                    ?.result
                                                    ?.arabicText ??
                                                "Some error occurred, check your internet connection",
                                            softWrap: true,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontFamily: 'Uthmani_font',
                                                //  fontWeight: FontWeight.w500,
                                                color: themeChanger.isDark
                                                    ? Colors.white
                                                        .withOpacity(0.87)
                                                    : Colors.black
                                                        .withOpacity(0.8),
                                                fontSize: 28.sp,
                                                height: 1.55),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(.60),
                                                  blurRadius: 4.r,
                                                  // spreadRadius: 8,
                                                  offset: Offset(0, 2.h)),
                                            ],
                                            color: Color(0xfff3fff9),
                                            // border: Border.all(
                                            //     color: Colors.grey.withOpacity(.5)),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.r)),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(12.h),
                                            child: SelectableText(
                                              hilaliAyahDataProvider
                                                      .ayahDataHilaliEntity
                                                      ?.result
                                                      ?.translation ??
                                                  "No data",
                                              //softWrap: true,
                                              textDirection: TextDirection.ltr,
                                              style: GoogleFonts.lexend(
                                                  fontWeight: FontWeight.w400,
                                                  color: themeChanger.isDark
                                                      ? Colors.white
                                                          .withOpacity(0.60)
                                                      : Color(0xff2e2e2e)
                                                          .withOpacity(.80),
                                                  fontSize: 14.sp,
                                                  height: 1.55),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 16.h,
                                ),
                                // Divider(
                                //   color: AppColors.blueColor.withOpacity(.12),
                                //   thickness: 1.h,
                                //   height: 0,
                                // ),
                                SizedBox(
                                  height: 24.h,
                                ),
                                Text(
                                  "Footnotes",
                                  style: GoogleFonts.poppins(
                                      // fontWeight: FontWeight.w500,
                                      color: themeChanger.isDark
                                          ? Colors.white.withOpacity(0.30)
                                          : Color(0xff515151).withOpacity(.6),
                                      fontSize: 16.sp,
                                      height: 1.55),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                                SelectableText(
                                  hilaliAyahDataProvider.ayahDataHilaliEntity
                                          ?.result?.footnotes ??
                                      "No data",
                                  //  softWrap: true,
                                  style: GoogleFonts.lexend(
                                      // fontWeight: FontWeight.w500,
                                      color: themeChanger.isDark
                                          ? Colors.white.withOpacity(0.60)
                                          : Color(0xff2e2e2e).withOpacity(.8),
                                      fontSize: 12.sp,
                                      height: 1.55),
                                ),
                                SizedBox(
                                  height: 8.h,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(30.0))),
          title: Text(
            'Is it permissible to write (S) or (SAWS) etc when mentioning the Prophet SAWS (peace and blessings of Allaah be upon him), instead of writing out the blessing in full?',
            style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700]),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Answer',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500])),
                SizedBox(
                  height: 1,
                ),
                Text(
                  'What is prescribed is to write “salla Allaahu ‘alayhi wa salaam (May Allaah send blessings and peace upon him)” in full, and not to write it in abbreviated form, such as writing (S) or (SAWS) etc.',
                  style: GoogleFonts.poppins(
                      fontSize: 15, color: Color(0xff2B5BBB)),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ButtonStyle(),
              child: Text(
                'Understood',
                style: GoogleFonts.poppins(),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future errorDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (_) => Dialog(
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
                            fontSize: 16.sp,
                            color: Color(0xffDD2F38),
                            fontWeight: FontWeight.w500),
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
                  "Try checking your internet connection, Or try after some time.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      color: Color(0xff636363),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<String?> openVerseInputDialog(BuildContext context, int maxVerses) {
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: false);

    final chapterAndVerse_SharedPref_provider =
        Provider.of<ChapterAndVerse_SharedPref_provider>(context,
            listen: false);
    return showDialog<String>(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(12.r))),
            title: Text(
              "Ayah search",
              style: GoogleFonts.poppins(color: const Color(0xff2B5BBB)),
            ),
            content: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: verseEditingController,
              decoration: InputDecoration(
                hintText: "Enter Ayah number within ${maxVerses}",
                hintStyle: GoogleFonts.poppins(fontSize: 12.sp),
              ),
            ),
            actions: [
              SizedBox(
                height: 5.h,
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    // chapterAndVerse_SharedPref_provider.saveChAndVerseFromSharedPref(chapterNo: hilaliAyahDataProvider.chapterNo, verseNo: hilaliAyahDataProvider.verseNo);// condition check
                    Navigator.of(context).pop(verseEditingController.text);
                  },
                  child: Column(
                    children: [
                      Ink(
                        //alignment: Alignment.center,
                        height: 48.h,
                        width: 248.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            stops: [.6, 1],
                            colors: [
                              AppColors.blueColor,
                              Color(0xff22B152),
                            ],
                          ),
                          color: AppColors.blueColor,
                          borderRadius: BorderRadius.all(Radius.circular(12.r)),
                        ),
                        child: Ink(
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 34.5.w,
                              ),
                              child: Text(
                                "Search",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: const Color(0xffFFF3F3)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20.h,
                      // )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          );
        });
  }

  void _copyToClipboard() {
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: false);
    final chapterListAndDataProvider =
        Provider.of<ChapterListAndDataProvider>(context, listen: false);
    final String arabicText =
        hilaliAyahDataProvider.ayahDataHilaliEntity?.result?.arabicText ?? '';
    final String surahText = chapterListAndDataProvider.chapterListDataEntity
            ?.chapters?[hilaliAyahDataProvider.chapterNo - 1].nameSimple ??
        "No data";
    final String translation =
        hilaliAyahDataProvider.ayahDataHilaliEntity?.result?.translation ?? '';
    final String footnotes =
        hilaliAyahDataProvider.ayahDataHilaliEntity?.result?.footnotes ?? '';
    final String translationInfo =
        "English - Mohsin Khan/Taqi-ud-Din-al-Hilali";

    final String appUrl =
        'https://play.google.com/store/apps/details?id=com.sparkbrightest.versebyverse';
    // Add Unicode bidirectional formatting characters for proper LTR and RTL handling
    final String allText =
        '$surahText  ${hilaliAyahDataProvider.chapterNo}:${hilaliAyahDataProvider.verseNo}\n\n\u202B$arabicText\u202C\n\n\u202A$translation\u202C\n\n\u202AFootnotes: $footnotes\n\n$translationInfo\n\nGet BitByBit:Quran app\n$appUrl';

    Clipboard.setData(ClipboardData(text: allText));
    _showToast("Copied");
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT, // Set the duration (SHORT or LONG)
      gravity: ToastGravity.BOTTOM, // Set the position (TOP, CENTER, or BOTTOM)
      backgroundColor: Colors.grey[800], // Customize the background color
      textColor: Colors.white, // Customize the text color
      fontSize: 14.0, // Customize the font size
    );
    debugPrint('Showing toast: $message');
  }
}
