import 'dart:io';
import 'package:path/path.dart';
import 'package:excel/excel.dart';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:xml/xml.dart';

class TranslationDownload {
  final dio = Dio();
  var url = 'https://quranenc.com/en/home/download/excel/english_hilali_khan';

  hilali_translation_download() async {
    var tempDir = await getApplicationDocumentsDirectory();
    String fullPath = tempDir.path + "/hilali_trans.xml";
    print('full path ${fullPath}');

    Response response = await dio.download(url, fullPath, deleteOnError: true);

// Response response = await dio.get(url,
// options: Options(
//   responseType: ResponseType.bytes,
//   followRedirects: false,
//   receiveTimeout: Duration.zero
// ));

    print(response.data.toString());
    var file = new File(fullPath);
//final document = XmlDocument.parse(file.readAsStringSync());

// final textual = document.descendants
//     .where((node) => node is XmlText && node.text.trim().isNotEmpty)
//     .join('\n');
// print(textual);

    //var file = 'Path_to_pre_existing_Excel_File/excel_file.xlsx';
    var bytes = File(fullPath).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    for (var table in excel.tables.keys) {
      print(excel.tables[table]!.cell(CellIndex.indexByString('D10')));
      
      // print(excel.tables[table]!.maxCols);
      // print(excel.tables[table]!.maxRows);
      // for (var row in excel.tables[table]!.rows) {
      //   print(row.map((e) => e?.value));
      // }
    }
  }
}
