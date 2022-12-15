

import 'package:flutter/cupertino.dart';
import 'package:verse_by_verse/modals/ChaptersList.dart';

import '../../data/response/api_response.dart';
import '../../repository/Home_Repository/chapter_list_repository.dart';


class HomeChapterListViewModel with ChangeNotifier {

  final _myRepo = ChapterListRepository();
  List<String?>? _chapterList;
  String? selectedItem;
  int? _chapterNo=1;
  ApiResponse<ChapterListBox> chapterListResponse= ApiResponse.loading();

  setChapterList(ApiResponse<ChapterListBox> response){
    chapterListResponse = response ;
    _chapterList= chapterListResponse.data?.chapters?.map((chapter) => chapter.nameSimple).toList();
    selectedItem=_chapterList?[0];
    notifyListeners();
  }


  List<String?>? get chapterList => _chapterList;
  int? get chapterNo => _chapterNo;

  Future<void> fetchChapterListApi ()async{

    setChapterList(ApiResponse.loading());

    _myRepo.fetchChaptersList().then((value){
      setChapterList(ApiResponse.completed(value));

    }).onError((error, stackTrace){
      setChapterList(ApiResponse.error(error.toString()));

    });
  }
  void selectItem(value){
    selectedItem= value;
    notifyListeners();
  }
  void getChapterNo(int? positionInDropDown){
    _chapterNo=positionInDropDown != null?positionInDropDown+1:0;
    notifyListeners();
  }


}