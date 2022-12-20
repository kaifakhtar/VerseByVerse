

import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';

import '../entities/Ayah_data_hilali_entity.dart';
import '../repositories/translation_repsitory.dart';

class GetHilaliAyahData {

  TranslationRepository _translationRepository;

  GetHilaliAyahData(this._translationRepository);

  Future<Either<Failure,AyahDataEntity>> call()async{
    return await _translationRepository.getHilaliAyahData();
  }
}