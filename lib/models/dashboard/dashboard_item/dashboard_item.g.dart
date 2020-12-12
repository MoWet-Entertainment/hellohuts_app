// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DashboardItem _$_$_DashboardItemFromJson(Map<String, dynamic> json) {
  return _$_DashboardItem(
    itemType: DashboardItem._setModeOfTransaction(json['item_type'] as String),
    itemText1: json['item_text1'] as String,
    itemText2: json['item_text2'] as String,
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
    createdBy: json['created_by'] as String,
    updatedBy: json['updated_by'] as String,
    providedBy: json['provided_by'] as String,
  );
}

Map<String, dynamic> _$_$_DashboardItemToJson(_$_DashboardItem instance) =>
    <String, dynamic>{
      'item_type': DashboardItem._getDashbordItemType(instance.itemType),
      'item_text1': instance.itemText1,
      'item_text2': instance.itemText2,
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
      'provided_by': instance.providedBy,
    };
