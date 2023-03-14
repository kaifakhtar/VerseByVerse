
 import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_and_verse_entity.dart';
import 'package:verse_by_verse/Features/Translation/domain/repositories/chapter_and_verse_repo.dart';
import 'package:verse_by_verse/core/errors/failure.dart';

import '../../../../core/network/network_info.dart';
import '../local/data_sources/getting_and_saving_ch_and_ver_from_shared_pref.dart';

class ChapterAndVerseRepoImpl implements ChapterAndVerseRepo{
  GettingAndSavingChapterAndVerseBySharedPrefDataSource gettingAndSavingChapterAndVerseBySharedPrefDataSource;

  NetworkInfo networkInfo;
  ChapterAndVerseRepoImpl(
      this.gettingAndSavingChapterAndVerseBySharedPrefDataSource,this.networkInfo);

  @override
  Future<Either<Failure, ChapterAndVerseEntity>> getChapterAndVerseFromSharedPref()async {
    if(networkInfo.isConnected){ // TODO dummy variable to be changed
      try{
        final chapterAndVerseEntity = await gettingAndSavingChapterAndVerseBySharedPrefDataSource.gettingTheChapterNoAndVerseNo();
        return Right(chapterAndVerseEntity);
      }catch(e){
        return Left(ServerFailure(message: "Some error occured"));
      }
    }
    else{
      //print("in the else statementin trans repo impl");
      return Left(ServerFailure(message: "Some error occured"));
    }
  }

  @override
  Future<void> saveChapterAndVerseFromSharedPref({required int chapterNo, required int verseNo}) async {
    gettingAndSavingChapterAndVerseBySharedPrefDataSource.savingTheChapterNoAndVerseNo(ChapterNo: chapterNo, verseNo: verseNo);
  }
}