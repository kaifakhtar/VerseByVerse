
import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_and_verse_entity.dart';
import 'package:verse_by_verse/Features/Translation/domain/repositories/chapter_and_verse_repo.dart';
import 'package:verse_by_verse/core/errors/failure.dart';

class GetChapterAndVerseFromSharedPref{
  ChapterAndVerseRepo chapterAndVerseRepo;

  GetChapterAndVerseFromSharedPref(this.chapterAndVerseRepo);

  Future<Either<Failure,ChapterAndVerseEntity>> call()async{
    return await chapterAndVerseRepo.getChapterAndVerseFromSharedPref();
  }


}