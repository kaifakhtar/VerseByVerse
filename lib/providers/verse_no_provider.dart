
import 'package:flutter/material.dart';

class VerseNoProvider with ChangeNotifier{
  int _verseNo=1;

  int get verseNo => _verseNo;

  void increaseVerseNo(){
    _verseNo++;
  }
  void decreaseVerseNo(){
    if(_verseNo!=1){_verseNo--;}
  }

  set verseNo(int value) {
    _verseNo = value;
  }
}