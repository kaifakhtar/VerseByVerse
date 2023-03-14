import 'package:shared_preferences/shared_preferences.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_and_verse_entity.dart';

import '../models/ChapterAndVerseModal.dart';
import 'getting_and_saving_ch_and_ver_from_shared_pref.dart';

class GettingAndSavingChapterAndVerseBySharedPrefDataSourceIMPL implements GettingAndSavingChapterAndVerseBySharedPrefDataSource{
  @override
  Future<ChapterAndVerseModal> gettingTheChapterNoAndVerseNo() async{
    final prefs = await SharedPreferences.getInstance();
    final int? chapterNo = prefs.getInt('chapter');
    final int? verse = prefs.getInt('verse');
    return ChapterAndVerseModal(chapterNo: chapterNo, VerseNo: verse);
  }

  @override
  Future<void> savingTheChapterNoAndVerseNo({required int ChapterNo, required int verseNo}) async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('chapter', ChapterNo);
    await prefs.setInt('verse', verseNo);
  }


}