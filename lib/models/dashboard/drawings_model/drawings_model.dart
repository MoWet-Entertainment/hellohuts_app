import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
part 'drawings_model.freezed.dart';
part 'drawings_model.g.dart';

@freezed
abstract class DrawingsModel with _$DrawingsModel {
  @JsonSerializable(explicitToJson: true)
  factory DrawingsModel({
    @JsonKey(name: JsonConstants.plan_type) String planType,
    @JsonKey(name: JsonConstants.plan_image) String planImage,
  }) = _DrawingsModel;


   factory DrawingsModel.fromJson(Map<String, dynamic> json) =>
      _$DrawingsModelFromJson(json);

  factory DrawingsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return DrawingsModel.fromJson(json);
  }
}
