import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/Features/Translation/presentation/widgets/shimmer_loading.dart';


import '../../../../utils/colors.dart';
import '../manager/Hilali_ayah_data_provider.dart';
import 'bottom_sheet.dart';

import 'drop_down_for_chapters.dart';

class VerseCard extends StatefulWidget {
  const VerseCard({Key? key}) : super(key: key);

  @override
  State<VerseCard> createState() => _VerseCardState();
}

class _VerseCardState extends State<VerseCard> {
  //HilaliTranslationDataViewModal? hilaliTranslationDataViewModal;

  @override
  Widget build(BuildContext context) {
    final hilaliAyahDataProvider =
        Provider.of<HilaliAyahDataProvider>(context, listen: true);
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    //final checkerTranslationNameViewModal = Provider.of<CheckerTranslationNameViewModal>(context);
    var cardHeight = screenHeight * (630 / 800);
    var cardWidth = screenWidth * 0.9055;
    //hilaliTranslationDataViewModal = Provider.of<HilaliTranslationDataViewModal>(context);

    return Container(
      height: cardHeight,
      //width: cardWidth,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(cardHeight * 0.047619),
        ),
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: cardWidth * (20 / cardWidth),
              vertical: cardHeight * (24 / cardHeight)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "2:256",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: cardHeight * 0.05079365,
                          color: const Color(0xff2B5BBB)),
                    ),
                    Container(
                      //width: screenWidth * (85 / 360),
                      height: screenHeight * (34 / 800),
                      decoration: const BoxDecoration(
                        color: Color(0xffDAE6FF),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: FittedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: cardWidth * (10 / cardWidth),
                              vertical: cardWidth * (10 / cardWidth)),
                          child: const ChaptersDropdown(),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: cardHeight * 0.025),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return BottomSheetTranslationChoice();
                          }),
                      child: Container(
                        width: screenWidth * (85 / 360),
                        height: screenHeight * (34 / 800),
                        decoration: const BoxDecoration(
                          color: AppColors.lightBlueColor,
                          borderRadius: const BorderRadius.all(Radius.circular(
                              50)), //TODO: change this to relative format
                        ),
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: cardWidth * (10 / cardWidth),
                                vertical: cardWidth * (10 / cardWidth)),
                            child: Text(
                              "Translation",
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: cardHeight * (12 / cardHeight),
                                  color: const Color(0xff2B5BBB)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => _showMyDialog(),
                      child: Icon(
                        Icons.info_outline,
                        color: Colors.deepOrangeAccent,
                      ),
                    )
                  ],
                ),
                SizedBox(height: cardHeight * (40 / cardHeight)),

                hilaliAyahDataProvider.ayahDataHilaliEntity == null
                    ? const ShimmerEffect()
                    : Column(
                      children: [
                        Text(
                            hilaliAyahDataProvider
                                    .ayahDataHilaliEntity?.result?.arabicText??
                                "No data",
                            softWrap: true,

                            textDirection: TextDirection.rtl,

                            style: TextStyle(
                                fontFamily: 'Uthmani_font',
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff515151),
                                fontSize: cardHeight * (28 / cardHeight),
                                height: 1.55),
                          ),
                        SizedBox(height: 30,),
                        Text(
                          hilaliAyahDataProvider
                              .ayahDataHilaliEntity?.result?.translation ??
                              "No data",
                          softWrap: true,

                          textDirection: TextDirection.ltr,

                          style: GoogleFonts.literata(

                              fontWeight: FontWeight.w500,
                              color: const Color(0xff515151),
                              fontSize: cardHeight * (19 / cardHeight),
                              height: 1.55),
                        ),
                      ],
                    ),
                //print(hilaliTranslationDataViewModal.translationDataResponse.data?.data?[0].text.toString());
              ],
            ),
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
          title:  Text(
              'Is it permissible to write (S) or (SAWS) etc when mentioning the Prophet SAWS (peace and blessings of Allaah be upon him), instead of writing out the blessing in full?',
          style: GoogleFonts.poppins(fontSize: 15,
          fontWeight: FontWeight.w600,
            color: Colors.grey[700]
          ),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Answer',
                    style:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold,
                        color:Colors.grey[500]
                        )),
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
}
