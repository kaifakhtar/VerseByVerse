import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class BottomSheetTranslationChoice extends StatelessWidget {
  List<String> translationNameList = [
    "Sahih International",
    "Muhammad Muhsin Khan and Hilali"
  ];

  @override
  Widget build(BuildContext context) {

    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: screenHeight * 0.4,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "Wait for this feature...",
          style: GoogleFonts.poppins(
              fontSize: screenHeight * 0.04),
        ),
      ),
    );
  }
}
