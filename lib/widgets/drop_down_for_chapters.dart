import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/providers/list_of_chapter_provider.dart';
import 'package:verse_by_verse/view_model/home_viewModal.dart';

import '../modals/ChaptersList.dart';
import '../providers/translation_data_provider.dart';
import '../providers/verse_no_provider.dart';

class ChaptersDropdown extends StatefulWidget {
  const ChaptersDropdown({Key? key}) : super(key: key);

  @override
  State<ChaptersDropdown> createState() => _ChaptersDropdownState();
}

class _ChaptersDropdownState extends State<ChaptersDropdown> {
  HomeChapterListViewModel? homeChapterListViewModel;

  //String? selectedItem="jjjj";
  List<String?>? chapters;

  void getDataOnBuid() async {
    homeChapterListViewModel?.fetchChapterListApi();
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
    final verseNoProviderObj = Provider.of<VerseNoProvider>(context);
    final translationProviderObject = Provider.of<TranslationDataProvider>(context);
    return Consumer<HomeChapterListViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return DropdownButtonHideUnderline(
          child: DropdownButton2<String>(

              value: value.selectedItem,
              iconSize: 40,
              iconEnabledColor:  const Color(0xff2B5BBB),
              items: value.chapterList
                  ?.map((chapterName) => DropdownMenuItem(
                      value: chapterName,
                      child: Text(
                        chapterName ?? "No Data",
                        style:
                            GoogleFonts.poppins(fontSize: cardHeight * (20/ cardHeight),
                              fontWeight: FontWeight.w600,
                                color: const Color(0xff2B5BBB),),
                      )))
                  .toList(),
              onChanged: (item) {
                value.selectItem(item);
                verseNoProviderObj.verseNo=1;
                value.getChapterNo(value.chapterList?.indexOf(item));
                translationProviderObject.getDatabyChapterNo(value.chapterNo);
              }),
        );
      },
    );
  }
}
