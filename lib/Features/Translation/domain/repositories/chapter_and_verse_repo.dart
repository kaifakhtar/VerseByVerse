
import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_and_verse_entity.dart';

import '../../../../core/errors/failure.dart';

abstract class ChapterAndVerseRepo {
  Future<Either<Failure,ChapterAndVerseEntity>> getChapterAndVerseFromSharedPref();
  Future<void> saveChapterAndVerseFromSharedPref({required int chapterNo,required int verseNo});
}