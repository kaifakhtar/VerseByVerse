
import 'package:flutter/cupertino.dart';
import 'package:verse_by_verse/modals/translation.dart';

import '../../data/response/api_response.dart';
import '../../repository/Home_Repository/translation_data_repository.dart';

class TranslationDataViewModal with ChangeNotifier{

  final _myRepo = TranslationDataRepository();
  ApiResponse<Translation> translationDataResponse= ApiResponse.loading();

    setTranslationData(ApiResponse<Translation> response){
      translationDataResponse = response ;
      notifyListeners();
    }

  Future<void> fetchTranslationDataByBothApi (int chapterNo,int verseNo)async{
    setTranslationData(ApiResponse.loading());


    _myRepo.fetchHilaiTranslationDataByBoth(chapterNo, verseNo).then((value){
      setTranslationData(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setTranslationData(ApiResponse.error(error.toString()));

    });
  }

  void getDatabyChapterNo(chapterNo) async{
    setTranslationData(ApiResponse.loading());


    _myRepo.fetchHilaiTranslationDataByChapterNo(chapterNo).then((value){
      setTranslationData(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setTranslationData(ApiResponse.error(error.toString()));

    });
}

}