



import '../../../domain/entities/Chapter_list_data_entity.dart';
import '../models/Ayah_data_modal.dart';

abstract class HilaliAyahDataSource{
  Future<AyahDataModal> getHilaliAyahData({required int chapterNo,required int verseNo});
  Future<ChapterListDataEntity> getChapterListData();
}