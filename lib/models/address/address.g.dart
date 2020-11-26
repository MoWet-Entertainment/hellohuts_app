// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$_$_AddressFromJson(Map<String, dynamic> json) {
  return _$_Address(
    address1: json['address1'] as String,
    address2: json['address2'] as String,
    postalLoc: json['postal_loc'] as String,
    postalCode: json['postal_code'] as String,
    district: json['district'] as String,
    state: json['state'] as String,
    country: json['country'] as String,
  );
}

Map<String, dynamic> _$_$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'address1': instance.address1,
      'address2': instance.address2,
      'postal_loc': instance.postalLoc,
      'postal_code': instance.postalCode,
      'district': instance.district,
      'state': instance.state,
      'country': instance.country,
    };
