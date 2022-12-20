import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:verse_by_verse/core/network/network_info.dart';





import 'Features/Translation/data/remote/data_sources/HilaliAyahDataSourceImpl.dart';
import 'Features/Translation/data/repositories/translation_repository_impl.dart';
import 'Features/Translation/domain/use_cases/getHilaliAyahData.dart';
import 'Features/Translation/presentation/manager/Hilali_ayah_data_provider.dart';
import 'Features/Translation/presentation/pages/Home.dart';

import 'package:http/http.dart' as http;
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: HilaliAyahDataProvider(GetHilaliAyahData(TranslationRepositoryImpl(HilaliAyahDataSourceImpl(client: http.Client()),NetworkInfoImpl()))))

  ],
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData(primaryColor: Color(0xff2B5BBB)),
    ),
  ));
}
