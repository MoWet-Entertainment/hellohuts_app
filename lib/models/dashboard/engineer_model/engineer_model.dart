import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/models/user/app_user.dart';

part 'engineer_model.freezed.dart';
part 'engineer_model.g.dart';

@freezed
abstract class EngineerModel implements _$EngineerModel {
  @JsonSerializable(explicitToJson: true)
  factory EngineerModel({
    @JsonKey(name: JsonConstants.engineerDetails) AppUser engineer,
    @JsonKey(name: JsonConstants.userRole) String userRole,
    @JsonKey(name: JsonConstants.userCompany) String userCompany,
  }) = _EngineerModel;

  
   factory EngineerModel.fromJson(Map<String, dynamic> json) =>
      _$EngineerModelFromJson(json);

  factory EngineerModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return EngineerModel.fromJson(json);
  }
}
