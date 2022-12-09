import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/providers/hadith_data_provider.dart';
import 'package:verse_by_verse/providers/verse_no_provider.dart';

import 'screens/Home.dart';

void main() {
  runApp(MultiProvider(providers: [
      ChangeNotifierProvider.value(value: HadithDataProvider()),
      ChangeNotifierProvider.value(value: VerseNoProvider()),
  ],
  child: MaterialApp(
      home: Home(),
      theme: ThemeData(primaryColor: Color(0xff2B5BBB)),
    ),
  ));
}
