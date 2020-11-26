import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/models/address/address.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class CompanyModel with _$CompanyModel {
  @JsonSerializable(explicitToJson: true)
  factory CompanyModel({
    @JsonKey(name: JsonConstants.address) Address companyAddress,
    @JsonKey(name: JsonConstants.companyName) String companyName,
    @JsonKey(name: JsonConstants.uniqueId) String companyId,
  }) = _CompanyModel;

   factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  factory CompanyModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return CompanyModel.fromJson(json);
  }
}
