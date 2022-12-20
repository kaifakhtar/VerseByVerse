
import 'package:dartz/dartz.dart';

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
  Future<Either<Failure, AyahDataEntity>> getHilaliAyahData()async {
    if(networkInfo.isConnected){
      try{
          final ayahDataHilaliEntity = await _hilaliAyahDataSource.getHilaliAyahData();
          return Right(ayahDataHilaliEntity);
      }on ServerException{
        return Left(ServerFailure());
      }
    }
    else{
      return Left(ServerFailure());
    }
  }

}