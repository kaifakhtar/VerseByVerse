


import '../repositories/chapter_and_verse_repo.dart';

class SaveChapterAndVerseToSharedPref{
  ChapterAndVerseRepo chapterAndVerseRepo;

  SaveChapterAndVerseToSharedPref(this.chapterAndVerseRepo);


  Future<void> call({required int chapterNo,required int verseNo}) async{
    await chapterAndVerseRepo.saveChapterAndVerseFromSharedPref(chapterNo: chapterNo, verseNo: verseNo);
  }
}