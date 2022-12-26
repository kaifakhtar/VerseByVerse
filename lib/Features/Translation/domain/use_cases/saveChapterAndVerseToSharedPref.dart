


import '../repositories/chapter_and_verse_repo.dart';

class SaveChapterAndVerseToSharedPref{
  ChapterAndVerseRepo chapterAndVerseRepo;

  SaveChapterAndVerseToSharedPref(this.chapterAndVerseRepo);


  Future<void> call() async{
    await chapterAndVerseRepo.getChapterAndVerseFromSharedPref();
  }
}