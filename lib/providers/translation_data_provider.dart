
import 'package:flutter/material.dart';
import 'package:verse_by_verse/modals/translation.dart';

import '../services/remote_services.dart';

class TranslationDataProvider with ChangeNotifier{
  Translation? _translationObject;

  Translation? get hadithData {
   return _translationObject;
  }
  void getData(verseCount,chapterNo) async{
    _translationObject=await RemoteService().getVerse(verseCount,chapterNo);
    notifyListeners();
  }
  void getDatabyChapterNo(chapterNo) async{
    _translationObject=await RemoteService().getVerseByChapterNo(chapterNo);
    notifyListeners();
  }

}