

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:verse_by_verse/core/errors/failure.dart';


import '../../domain/entities/Ayah_data_hilali_entity.dart';
import '../../domain/use_cases/getHilaliAyahData.dart';
import 'ChapterAndVerse_SharedPref_provider.dart';

class HilaliAyahDataProvider with ChangeNotifier{
  GetHilaliAyahData _getHilaliAyahData; // use case object
  bool isLoading= false;
  ChapterAndVerse_SharedPref_provider? chapterAndVerse_SharedPref_provider;
   int _chapterNo=55;
   int _verseNo=5 ;
  AyahDataEntity? ayahDataHilaliEntity;
  Either<Failure,AyahDataEntity>? ayahDataHilaliEntityORfailure;

bool isFailureEntity=false;

  int get chapterNo => _chapterNo;



  HilaliAyahDataProvider(this._getHilaliAyahData,this.chapterAndVerse_SharedPref_provider);



  Future<void> getHilaliAyahDataEntity()async{

    isLoading=true;
    notifyListeners();
     ayahDataHilaliEntityORfailure=await _getHilaliAyahData.call(chapterNo: chapterNo,versoNo: verseNo);
    isLoading=false;
    ayahDataHilaliEntity = ayahDataHilaliEntityORfailure?.foldRight(null, (r, previous) => r);
   //ayahDataHilaliEntityORfailure?.fold((l) => l, (r) => r);

    // ayahDataHilaliEntityORfailure?.isLeft();
    if(ayahDataHilaliEntityORfailure!=null){
      if(ayahDataHilaliEntityORfailure!.isLeft()){
        isFailureEntity=true;
        notifyListeners();
      }
      else{isFailureEntity=false;notifyListeners();}
    }
    // print("Footnotes are down");
    // print(ayahDataHilaliEntity?.result?.footnotes) ;
    notifyListeners();
  }



  int get verseNo => _verseNo;



   static Future<int?> getChapterFromSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('chapter')!;
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

 void setChapterAndVerseFromSharedPref(int? ch, int? ver){
    _chapterNo=ch??55;
    _verseNo=ver??5;
 }

 void incrementVerseBy1(){
    _verseNo++;
    getHilaliAyahDataEntity();
 }
  void decrementVerseBy1(){
    _verseNo--;
    getHilaliAyahDataEntity();
  }
  void setSpecificVerse({required int verse}){
    _verseNo=verse;
    getHilaliAyahDataEntity();
  }
  void changeChapterAndResetVerseTo1({required int chapter}){

    _chapterNo=chapter;
    _verseNo=1;
    getHilaliAyahDataEntity();
  }
  void decrementChapterBy1(){
    _chapterNo--;
    getHilaliAyahDataEntity();
  }
  void incrementChapterBy1(){
    _chapterNo++;
    getHilaliAyahDataEntity();
  }





}