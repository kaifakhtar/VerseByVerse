
import 'package:flutter/material.dart';

import '../modals/ChaptersList.dart';
import '../modals/translation.dart';
import '../services/remote_services.dart';

class ListOfChapterProvider with ChangeNotifier{

  ChapterListBox? _chapterListBox;
  List<String?>? _chapterList;
  String? selectedItem;
  int? _chapterNo=1;

  ChapterListBox? get chapterListBox {
    return _chapterListBox;
  }


  List<String?>? get chapterList {
   _chapterList= chapterListBox?.chapters?.map((chapter) => chapter.nameSimple).toList();
    return _chapterList;
  }

  void getData() async{
    _chapterListBox=await RemoteService().getChaptersList();
    _chapterList= chapterListBox?.chapters?.map((chapter) => chapter.nameSimple).toList();  // chapter name list
    selectedItem=_chapterList?[0];
    notifyListeners();
  }

  void selectItem(value){
    selectedItem= value;
    notifyListeners();
  }

 void getChapterNo(int? positionInDropDown){
    _chapterNo=positionInDropDown != null?positionInDropDown+1:0;
    notifyListeners();
 }

  int? get chapterNo => _chapterNo;



}
