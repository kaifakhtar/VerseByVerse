import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:verse_by_verse/Features/Translation/data/local/data_sources/getting_and_saving_ch_and_ver_from_shared_pref_IMPL.dart';
import 'package:verse_by_verse/Features/Translation/data/repositories/ChapterAndVerseRepoImpl.dart';
import 'package:verse_by_verse/Features/Translation/domain/use_cases/getChapterListAndData.dart';
import 'package:verse_by_verse/Features/Translation/presentation/manager/ChapterListAndDataProvider.dart';

import 'package:verse_by_verse/core/network/network_info.dart';





import 'Features/Translation/data/local/data_sources/getting_and_saving_ch_and_ver_from_shared_pref.dart';
import 'Features/Translation/data/remote/data_sources/HilaliAyahDataSourceImpl.dart';
import 'Features/Translation/data/repositories/translation_repository_impl.dart';
import 'Features/Translation/domain/repositories/chapter_and_verse_repo.dart';
import 'Features/Translation/domain/use_cases/getChapter_and_verse_for_shared_pref.dart';
import 'Features/Translation/domain/use_cases/getHilaliAyahData.dart';
import 'Features/Translation/domain/use_cases/saveChapterAndVerseToSharedPref.dart';
import 'Features/Translation/presentation/manager/ChapterAndVerse_SharedPref_provider.dart';
import 'Features/Translation/presentation/manager/Hilali_ayah_data_provider.dart';
import 'Features/Translation/presentation/pages/Home.dart';

import 'package:http/http.dart' as http;
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: HilaliAyahDataProvider(GetHilaliAyahData(TranslationRepositoryImpl(HilaliAyahDataSourceImpl(client: http.Client()), NetworkInfoImpl())),ChapterAndVerse_SharedPref_provider(GetChapterAndVerseFromSharedPref(ChapterAndVerseRepoImpl(GettingAndSavingChapterAndVerseBySharedPrefDataSourceIMPL(),NetworkInfoImpl())),SaveChapterAndVerseToSharedPref(ChapterAndVerseRepoImpl(GettingAndSavingChapterAndVerseBySharedPrefDataSourceIMPL(),NetworkInfoImpl()))))),
  ChangeNotifierProvider.value(value: ChapterListAndDataProvider(GetChapterListData(TranslationRepositoryImpl(HilaliAyahDataSourceImpl(client: http.Client()),NetworkInfoImpl())))),
  ChangeNotifierProvider.value(value: ChapterAndVerse_SharedPref_provider(GetChapterAndVerseFromSharedPref(ChapterAndVerseRepoImpl(GettingAndSavingChapterAndVerseBySharedPrefDataSourceIMPL(),NetworkInfoImpl())),SaveChapterAndVerseToSharedPref(ChapterAndVerseRepoImpl(GettingAndSavingChapterAndVerseBySharedPrefDataSourceIMPL(),NetworkInfoImpl())))),
  ],
  child: ScreenUtilInit(
      designSize: const Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context , child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(primaryColor: Color(0xff2B5BBB)),
    );}
  ),
  ));
}
