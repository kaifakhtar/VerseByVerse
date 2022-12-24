

import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_list_data_entity.dart';


import '../../../../core/errors/failure.dart';

import '../entities/Ayah_data_hilali_entity.dart';
import '../repositories/translation_repsitory.dart';

class GetChapterListData {

  TranslationRepository _translationRepository;

  GetChapterListData(this._translationRepository);

  Future<Either<Failure,ChapterListDataEntity>> call()async{
    return await _translationRepository.getChapterListData();
  }
}




