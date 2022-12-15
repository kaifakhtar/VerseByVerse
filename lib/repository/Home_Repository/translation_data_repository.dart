

import '../../data/network/BaseApiService.dart';
import '../../data/network/NetworkApiService.dart';
import '../../modals/ChaptersList.dart';
import '../../modals/translation.dart';
import '../../res/app_urls.dart';

class TranslationDataRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<Translation?> fetchHilaiTranslationDataByBoth(int chapterNo, int verseNo) async {

    try{
      var hilaiTransUrl = "${AppUrls.translationBaseUrl}$chapterNo:$verseNo${AppUrls.hilaliTranslationEndPoint}";
      dynamic response = await _apiServices.getGetApiResponse(hilaiTransUrl);
      return response = Translation.fromJson(response);

    }catch(e){
      print(e.toString()) ;

    }
    return null;
  }

  Future<Translation?> fetchHilaiTranslationDataByChapterNo(int chapterNo) async {

    try{
      var hilaiTransUrl = "${AppUrls.translationBaseUrl}$chapterNo:1${AppUrls.hilaliTranslationEndPoint}";
      dynamic response = await _apiServices.getGetApiResponse(hilaiTransUrl);
      return response = Translation.fromJson(response);

    }catch(e){
      print(e.toString()) ;

    }
    return null;
  }

}