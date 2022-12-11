import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/providers/translation_data_provider.dart';
import 'package:verse_by_verse/providers/list_of_chapter_provider.dart';
import 'package:verse_by_verse/providers/verse_no_provider.dart';

import 'screens/Home.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: TranslationDataProvider()),
      ChangeNotifierProvider.value(value: VerseNoProvider()),
      ChangeNotifierProvider.value(value: ListOfChapterProvider()),
  ],
  child: MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Color(0xff2B5BBB)),
    ),
  ));
}
