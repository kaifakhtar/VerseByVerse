
import 'dart:convert';



import 'package:http/http.dart' as http;



import '../../../../../core/errors/errors.dart';
import '../models/Ayah_data_modal.dart';
import 'HilaliAyahData_DataSource.dart';


class HilaliAyahDataSourceImpl implements HilaliAyahDataSource{

  final http.Client client;

  HilaliAyahDataSourceImpl({required this.client});

  @override
  Future<AyahDataModal> getHilaliAyahData() async{
    final response = await client.get(Uri.parse('https://quranenc.com/api/v1/translation/aya/english_hilali_khan/9/3'));

    if (response.statusCode == 200) {
      print(response.contentLength);
      return AyahDataModal.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }

}