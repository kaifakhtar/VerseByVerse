
import 'package:flutter/material.dart';
import 'package:verse_by_verse/modals/translation.dart';

import '../services/remote_services.dart';

class HadithDataProvider with ChangeNotifier{
  Translation? _hadithData;

  Translation? get hadithData {
   return _hadithData;
  }
  void getData(verseCount) async{
    _hadithData=await RemoteService().getVerse(verseCount);
    notifyListeners();
  }
}