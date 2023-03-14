
import '../../../domain/entities/Chapter_and_verse_entity.dart';
import '../models/ChapterAndVerseModal.dart';

abstract class GettingAndSavingChapterAndVerseBySharedPrefDataSource{
 Future<void> savingTheChapterNoAndVerseNo({required int ChapterNo, required int verseNo});
 Future<ChapterAndVerseModal> gettingTheChapterNoAndVerseNo();

}
