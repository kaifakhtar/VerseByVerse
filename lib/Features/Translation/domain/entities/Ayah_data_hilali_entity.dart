class AyahDataEntity {
  Result? result;

  AyahDataEntity({required this.result});

  AyahDataEntity.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? new Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.toJson();
    }
    return data;
  }
}

class Result {
  String? id;
  String? sura;
  String? aya;
  String? arabicText;
  String? translation;
  String? footnotes;

  Result(
      {this.id,
        this.sura,
        this.aya,
        this.arabicText,
        this.translation,
        this.footnotes});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sura = json['sura'];
    aya = json['aya'];
    arabicText = json['arabic_text'];
    translation = json['translation'];
    footnotes = json['footnotes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sura'] = this.sura;
    data['aya'] = this.aya;
    data['arabic_text'] = this.arabicText;
    data['translation'] = this.translation;
    data['footnotes'] = this.footnotes;
    return data;
  }
}
