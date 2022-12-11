
import 'package:flutter/material.dart';
import 'package:verse_by_verse/modals/translation.dart';

import '../services/remote_services.dart';

class TranslationDataProvider with ChangeNotifier{
  Translation? _translationObject;
  bool _isloading =false;

  Translation? get hadithData {
   return _translationObject;
  }

  bool get isloading => _isloading;

  void getData(verseCount,chapterNo) async{
    toggleloading();
    _translationObject=await RemoteService().getVerse(verseCount,chapterNo);
    toggleloading();
    notifyListeners();
  }
  void getDatabyChapterNo(chapterNo) async{
    toggleloading();
    _translationObject=await RemoteService().getVerseByChapterNo(chapterNo);
    toggleloading();
    notifyListeners();
  }
 void toggleloading(){
   _isloading = !_isloading;
   notifyListeners();
 }
}