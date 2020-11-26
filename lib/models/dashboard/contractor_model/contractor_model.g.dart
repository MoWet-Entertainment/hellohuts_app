// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ContractorModel _$_$_ContractorModelFromJson(Map<String, dynamic> json) {
  return _$_ContractorModel(
    contractorName: json['contractor_name'] as String,
    contractorAddress: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    contractorCompany: json['contractor_company'] == null
        ? null
        : CompanyModel.fromJson(
            json['contractor_company'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ContractorModelToJson(_$_ContractorModel instance) =>
    <String, dynamic>{
      'contractor_name': instance.contractorName,
      'address': instance.contractorAddress?.toJson(),
      'contractor_company': instance.contractorCompany?.toJson(),
    };
