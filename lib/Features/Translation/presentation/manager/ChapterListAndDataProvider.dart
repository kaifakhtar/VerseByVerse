import 'package:flutter/material.dart';
import 'package:verse_by_verse/Features/Translation/domain/use_cases/getChapterListAndData.dart';

import '../../domain/entities/Chapter_list_data_entity.dart';

class ChapterListAndDataProvider with ChangeNotifier{
  GetChapterListData _getChapterListData;
  ChapterListDataEntity? _chapterListDataEntity;


  ChapterListDataEntity? get chapterListDataEntity => _chapterListDataEntity;

  ChapterListAndDataProvider(this._getChapterListData);

  Future<void> getchapterListDataEntity()async{
    var _chapterListDataEntityORfailure=await _getChapterListData.call();

    var anyObject = _chapterListDataEntityORfailure.fold((l) => l, (r) => r);

    _chapterListDataEntity = _chapterListDataEntityORfailure.foldRight(null, (r, previous) => r);
    //quote=Right(quoteEntity);


    //quote=quoteEntity.fold((l) => null, (r) => r);
    print(anyObject.toString());

    print(_chapterListDataEntityORfailure.isRight());
    print("Footnotes are down");
    print(_chapterListDataEntity?.chapters?.length) ;
    notifyListeners();
  }
}