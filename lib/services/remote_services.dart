import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:verse_by_verse/modals/ChaptersList.dart';

import '../modals/translation.dart';

class RemoteService {
  //nt verseCount=1;



  Future<Translation?> getVerse(int verseCount,int chapterNo) async {
    var client = http.Client();
    var uri = Uri.parse('https://api.alquran.cloud/v1/ayah/${chapterNo}:${verseCount}/editions/en.hilali');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Translation.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }

  Future<ChapterListBox?> getChaptersList() async { // get list of chapter object from internet
    var client = http.Client();
    var uri = Uri.parse('https://api.quran.com/api/v4/chapters?language=en');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return ChapterListBox.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }
  Future<Translation?> getVerseByChapterNo(int chapterNo) async {
    var client = http.Client();
    var uri = Uri.parse('https://api.alquran.cloud/v1/ayah/${chapterNo}:1/editions/en.hilali');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Translation.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }


}
