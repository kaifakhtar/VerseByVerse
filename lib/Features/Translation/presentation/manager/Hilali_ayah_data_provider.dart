

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../domain/entities/Ayah_data_hilali_entity.dart';
import '../../domain/use_cases/getHilaliAyahData.dart';

class HilaliAyahDataProvider with ChangeNotifier{
  GetHilaliAyahData _hilaliAyahData;
  bool isLoading= false;


  AyahDataEntity? ayahDataHilaliEntity;
  var _chapterNo=1;
  int _verseNo =1;


  int get chapterNo => _chapterNo;

  set chapterNo(int value) {
    _chapterNo = value;
    //_verseNo=1;
    getHilaliAyahDataEntity();
  }

  HilaliAyahDataProvider(this._hilaliAyahData);

  Future<void> getHilaliAyahDataEntity()async{

    isLoading=true;
    notifyListeners();
    var ayahDataHilaliEntityORfailure=await _hilaliAyahData.call(chapterNo: chapterNo,versoNo: verseNo);
    isLoading=false;
    ayahDataHilaliEntity = ayahDataHilaliEntityORfailure.foldRight(null, (r, previous) => r);

    print(ayahDataHilaliEntityORfailure.isRight());
    print("Footnotes are down");
    print(ayahDataHilaliEntity?.result?.footnotes) ;
    notifyListeners();
  }
  void increaseVerseNo(){
    verseNo++;
    saveData();
    getHilaliAyahDataEntity();
  }
  void decreaseVerseNo(){
    verseNo--;
    saveData();
    getHilaliAyahDataEntity();
  }

  int get verseNo => _verseNo;

  set verseNo(int value) {
    _verseNo = value;
    saveData();
    getHilaliAyahDataEntity();
  }

  void changeChapter({required int chapterNumber}){
    _chapterNo=chapterNumber;
    _verseNo=1;
    saveData();
    getHilaliAyahDataEntity();
  }
   static Future<int?> getChapterFromSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chapter');
  }
 void saveData()async{

   final prefs = await SharedPreferences.getInstance();
   await prefs.setInt('chapter', chapterNo);
   await prefs.setInt('verse', verseNo);
   print("in the save data method");
 }


}