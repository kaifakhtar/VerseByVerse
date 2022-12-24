
import 'dart:convert';



import 'package:http/http.dart' as http;
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_list_data_entity.dart';



import '../../../../../core/errors/errors.dart';
import '../models/Ayah_data_modal.dart';
import '../models/Chapter_list_data_modal.dart';
import 'HilaliAyahData_DataSource.dart';


class HilaliAyahDataSourceImpl implements HilaliAyahDataSource{

  final http.Client client;

  HilaliAyahDataSourceImpl({required this.client});

  @override
  Future<AyahDataModal> getHilaliAyahData({required int chapterNo, required int verseNo}) async{
    final response = await client.get(Uri.parse('https://quranenc.com/api/v1/translation/aya/english_hilali_khan/${chapterNo}/${verseNo}'));

    if (response.statusCode == 200) {
      print(response.contentLength);
      return AyahDataModal.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ChapterListDataEntity> getChapterListData() async {
    final response = await client.get(Uri.parse('https://api.quran.com/api/v4/chapters?language=en'));

    if (response.statusCode == 200) {
      print(response.contentLength);
      return ChapterListDataModal.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}