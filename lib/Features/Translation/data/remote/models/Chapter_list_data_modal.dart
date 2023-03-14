
import 'package:verse_by_verse/Features/Translation/domain/entities/Chapter_list_data_entity.dart';

class ChapterListDataModal extends ChapterListDataEntity{

  ChapterListDataModal({
    required List<Chapters>? chapters,
  }) : super(
    chapters: chapters,
  );
  factory ChapterListDataModal.fromJson(Map<String, dynamic> json) {

    return ChapterListDataModal(
        chapters: dataMeth(json)
    );


  }

  static List<Chapters>? dataMeth(Map<String, dynamic> json) {
    List<Chapters>? chapters;
    if (json['chapters'] != null) {
      chapters = <Chapters>[];
      json['chapters'].forEach((v) {
        chapters!.add(new Chapters.fromJson(v));
      });
    }
    return chapters;

  }
}