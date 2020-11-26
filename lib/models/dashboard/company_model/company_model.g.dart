// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CompanyModel _$_$_CompanyModelFromJson(Map<String, dynamic> json) {
  return _$_CompanyModel(
    companyAddress: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    companyName: json['company_name'] as String,
    companyId: json['unique_id'] as String,
  );
}

Map<String, dynamic> _$_$_CompanyModelToJson(_$_CompanyModel instance) =>
    <String, dynamic>{
      'address': instance.companyAddress?.toJson(),
      'company_name': instance.companyName,
      'unique_id': instance.companyId,
    };
