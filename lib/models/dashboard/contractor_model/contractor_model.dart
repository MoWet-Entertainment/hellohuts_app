import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/models/address/address.dart';
import 'package:hellohuts_app/models/dashboard/company_model/company_model.dart';

part 'contractor_model.freezed.dart';
part 'contractor_model.g.dart';

@freezed
abstract class ContractorModel with _$ContractorModel {
  @JsonSerializable(explicitToJson: true)
  factory ContractorModel({
    @JsonKey(name: JsonConstants.contractorName) String contractorName,
    @JsonKey(name: JsonConstants.address) Address contractorAddress,
    @JsonKey(name: JsonConstants.contractorCompany)
        CompanyModel contractorCompany,
  }) = _ContractorModel;

  
   factory ContractorModel.fromJson(Map<String, dynamic> json) =>
      _$ContractorModelFromJson(json);

  factory ContractorModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return ContractorModel.fromJson(json);
  }
}
