

import 'package:flutter/material.dart';


import '../../domain/entities/Ayah_data_hilali_entity.dart';
import '../../domain/use_cases/getHilaliAyahData.dart';

class HilaliAyahDataProvider with ChangeNotifier{
  GetHilaliAyahData _getHilaliAyahData;


  AyahDataEntity? ayahDataHilaliEntity;



  HilaliAyahDataProvider(this._getHilaliAyahData);

  Future<void> getHilaliAyahDataEntity()async{
    var ayahDataHilaliEntityORfailure=await _getHilaliAyahData.call();
    ayahDataHilaliEntity = ayahDataHilaliEntityORfailure.foldRight(null, (r, previous) => r);
    //quote=Right(quoteEntity);


    //quote=quoteEntity.fold((l) => null, (r) => r);
    print(ayahDataHilaliEntityORfailure.isRight());
    print("Footnotes are down");
    print(ayahDataHilaliEntity?.result?.footnotes) ;
    notifyListeners();
  }
}