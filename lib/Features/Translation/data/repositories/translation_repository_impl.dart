
import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_list_data_entity.dart';

import 'package:verse_by_verse/core/errors/failure.dart';
import 'package:verse_by_verse/core/network/network_info.dart';


import '../../../../core/errors/errors.dart';

import '../../domain/entities/Ayah_data_hilali_entity.dart';
import '../../domain/repositories/translation_repsitory.dart';
import '../remote/data_sources/HilaliAyahData_DataSource.dart';

class TranslationRepositoryImpl implements TranslationRepository{
  HilaliAyahDataSource _hilaliAyahDataSource;
  NetworkInfo networkInfo;

  TranslationRepositoryImpl(this._hilaliAyahDataSource,this.networkInfo);





  @override
  Future<Either<Failure,AyahDataEntity>> getHilaliAyahData({required int chapterNo,required int verseNo})async {
    if(networkInfo.isConnected){
      try{
          final ayahDataHilaliEntity = await _hilaliAyahDataSource.getHilaliAyahData(chapterNo: chapterNo,verseNo:verseNo);
          return Right(ayahDataHilaliEntity);
      }catch(e){
        return Left(ServerFailure(message: "Some error occured"));
      }
    }
    else{
      print("in the else statementin trans repo impl");
      return Left(ServerFailure(message: "Some error occured"));
    }
  }

  @override
  Future<Either<Failure, ChapterListDataEntity>> getChapterListData() async {
    if(networkInfo.isConnected){
      try{
        final chapterListData = await _hilaliAyahDataSource.getChapterListData();
        return Right(chapterListData);
      }catch(e){
        return Left(ServerFailure(message: "Some error occured"));
      }
    }
    else{
      print("in the else statementin trans repo impl");
      return Left(ServerFailure(message: "Some error occured"));
    }
  }

}