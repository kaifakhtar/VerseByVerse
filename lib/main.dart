import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/providers/translation_data_provider.dart';

import 'package:verse_by_verse/providers/verse_no_provider.dart';
import 'package:verse_by_verse/view/screens/Home.dart';

import 'view_model/home_viewModal.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: TranslationDataProvider()),
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
