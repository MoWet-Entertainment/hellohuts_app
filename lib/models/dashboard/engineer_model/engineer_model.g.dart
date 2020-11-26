// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'engineer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EngineerModel _$_$_EngineerModelFromJson(Map<String, dynamic> json) {
  return _$_EngineerModel(
    engineer: json['engineer_details'] == null
        ? null
        : AppUser.fromJson(json['engineer_details'] as Map<String, dynamic>),
    userRole: json['user_role'] as String,
    userCompany: json['user_company'] as String,
  );
}

Map<String, dynamic> _$_$_EngineerModelToJson(_$_EngineerModel instance) =>
    <String, dynamic>{
      'engineer_details': instance.engineer?.toJson(),
      'user_role': instance.userRole,
      'user_company': instance.userCompany,
    };
