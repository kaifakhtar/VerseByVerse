



import '../models/Ayah_data_modal.dart';

abstract class HilaliAyahDataSource{
  Future<AyahDataModal> getHilaliAyahData();
}