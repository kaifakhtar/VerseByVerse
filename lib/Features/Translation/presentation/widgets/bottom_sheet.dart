import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class BottomSheetTranslationChoice extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TextField(
              //autofocus: true,
        )
      ),
    );
  }
}
