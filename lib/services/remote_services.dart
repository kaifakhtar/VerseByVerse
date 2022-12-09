import 'dart:convert';

import 'package:http/http.dart' as http;

import '../modals/translation.dart';

class RemoteService {
  //nt verseCount=1;



  Future<Translation?> getVerse(int verseCount) async {
    var client = http.Client();
    var uri = Uri.parse('https://api.alquran.cloud/v1/ayah/${verseCount}/editions/en.hilali');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return Translation.fromJson(jsonDecode(json));
    } else {
      return null;
    }
  }
}
