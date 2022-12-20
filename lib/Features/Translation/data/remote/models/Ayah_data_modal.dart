
import '../../../domain/entities/Ayah_data_hilali_entity.dart';

class AyahDataModal extends AyahDataEntity{

AyahDataModal({
    required Result? result,
}) :super(
      result: result,
     );

factory AyahDataModal.fromJson(Map<String, dynamic> json) {
  return AyahDataModal(
      result: dataMeth(json)
  );
}

 static Result? dataMeth(Map<String, dynamic> json){
   Result? result;
   if (json['result'] != null) {
     result =
     json['result'] != null ? new Result.fromJson(json['result']) : null;
   }
   print("arbic text in datamodal down");
   print(result?.arabicText);
   return result;
 }
}
