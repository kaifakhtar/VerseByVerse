

import 'package:dartz/dartz.dart';


import '../../../../core/errors/failure.dart';
import '../entities/Ayah_data_hilali_entity.dart';

abstract class TranslationRepository{

Future<Either<Failure,AyahDataEntity>> getHilaliAyahData();
}