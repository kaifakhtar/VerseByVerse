

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../domain/entities/Ayah_data_hilali_entity.dart';
import '../../domain/use_cases/getHilaliAyahData.dart';
import 'ChapterAndVerse_SharedPref_provider.dart';

class HilaliAyahDataProvider with ChangeNotifier{
  GetHilaliAyahData _getHilaliAyahData; // use case object
  bool isLoading= false;
  ChapterAndVerse_SharedPref_provider? chapterAndVerse_SharedPref_provider;
  int _chapterNo=1;
  int _verseNo=1 ;
  AyahDataEntity? ayahDataHilaliEntity;



  int get chapterNo => _chapterNo;

  set chapterNo(int value) {
    _chapterNo = value;
    //_verseNo=1;
    getHilaliAyahDataEntity();
  }

  HilaliAyahDataProvider(this._getHilaliAyahData,this.chapterAndVerse_SharedPref_provider);



  Future<void> getHilaliAyahDataEntity()async{

    isLoading=true;
    notifyListeners();
    var ayahDataHilaliEntityORfailure=await _getHilaliAyahData.call(chapterNo: chapterNo,versoNo: verseNo);
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

 void initialiseChapterAndVerseInProvider()async{
  _chapterNo =  await chapterAndVerse_SharedPref_provider?.chapterAndVerseEntity?.chapterNo??1;
  _verseNo = await chapterAndVerse_SharedPref_provider?.chapterAndVerseEntity?.VerseNo??1;
 }


}