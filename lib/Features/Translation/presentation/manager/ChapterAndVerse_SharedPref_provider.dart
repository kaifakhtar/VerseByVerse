
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/errors/failure.dart';
import '../../domain/entities/Chapter_and_verse_entity.dart';
import '../../domain/use_cases/getChapter_and_verse_for_shared_pref.dart';
import '../../domain/use_cases/saveChapterAndVerseToSharedPref.dart';

class ChapterAndVerse_SharedPref_provider with ChangeNotifier{
  var chapterAndVerseEntityOrFailure;
  GetChapterAndVerseFromSharedPref getChapterAndVerseFromSharedPref;
  SaveChapterAndVerseToSharedPref saveChapterAndVerseToSharedPref;
  ChapterAndVerseEntity? chapterAndVerseEntity;


  ChapterAndVerse_SharedPref_provider(
      this.getChapterAndVerseFromSharedPref,
      this.saveChapterAndVerseToSharedPref);

  Future<void> getChAndVerseFromSharedPref()async{
    chapterAndVerseEntityOrFailure=await getChapterAndVerseFromSharedPref.call();
    chapterAndVerseEntity = chapterAndVerseEntityOrFailure.foldRight(null, (r, previous) => r);
    notifyListeners();
  }

  Future<void> saveChAndVerseFromSharedPref({required int chapterNo, required int verseNo})async {

    await saveChapterAndVerseToSharedPref.call();
  }
}