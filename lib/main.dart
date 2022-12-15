import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:verse_by_verse/view_model/HomeScreen_View_modals/verse_no_provider.dart';
import 'package:verse_by_verse/view/screens/Home.dart';
import 'package:verse_by_verse/view_model/HomeScreen_View_modals/Translation_data_view_modal.dart';

import 'view_model/HomeScreen_View_modals/chapterListviewModal.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: TranslationDataViewModal()),
      ChangeNotifierProvider.value(value: VerseNoProvider()),
      ChangeNotifierProvider.value(value: HomeChapterListViewModel()),
      ChangeNotifierProvider.value(value: VerseNoProvider()),
  ],
  child: MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Color(0xff2B5BBB)),
    ),
  ));
}
