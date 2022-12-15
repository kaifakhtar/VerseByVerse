



import '../../data/network/BaseApiService.dart';
import '../../data/network/NetworkApiService.dart';
import '../../modals/ChaptersList.dart';
import '../../res/app_urls.dart';

class ChapterListRepository {

  final BaseApiServices _apiServices = NetworkApiService() ;

  Future<ChapterListBox?> fetchChaptersList() async {

    try{

      dynamic response = await _apiServices.getGetApiResponse(AppUrls.chapterlistUrl);
      return response = ChapterListBox.fromJson(response);

    }catch(e){
        print(e.toString()) ;

    }
  }

}