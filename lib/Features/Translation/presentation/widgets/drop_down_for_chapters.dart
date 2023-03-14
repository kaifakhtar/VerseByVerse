import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class ChaptersDropdown extends StatefulWidget {
  const ChaptersDropdown({Key? key}) : super(key: key);

  @override
  State<ChaptersDropdown> createState() => _ChaptersDropdownState();
}

class _ChaptersDropdownState extends State<ChaptersDropdown> {

  List<String?>? chapters;

  void getDataOnBuid() async {
    //homeChapterListViewModel?.fetchChapterListApi();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDataOnBuid();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var cardHeight = screenHeight * (630 / 800);
    var cardWidth = screenWidth * 0.9055;


        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
              value: "Chapters",
              iconSize: 40,
              iconEnabledColor:  const Color(0xff2B5BBB),
            items: [

            ],

              ),
        );
      }
  }

