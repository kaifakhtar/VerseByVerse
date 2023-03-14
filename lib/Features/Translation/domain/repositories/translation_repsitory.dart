

import 'package:dartz/dartz.dart';
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_list_data_entity.dart';


import '../../../../core/errors/failure.dart';
import '../entities/Ayah_data_hilali_entity.dart';

abstract class TranslationRepository{

Future<Either<Failure,AyahDataEntity>> getHilaliAyahData({required int chapterNo,required int verseNo});
Future<Either<Failure,ChapterListDataEntity>> getChapterListData();
}