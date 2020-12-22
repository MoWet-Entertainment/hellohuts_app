// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DocumentsModel _$_$_DocumentsModelFromJson(Map<String, dynamic> json) {
  return _$_DocumentsModel(
    projectDocuments: (json['project_documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    personalDocuments: (json['personal_documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    otherDocuments: (json['other_documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    specificationDocuments: (json['specification_documents'] as List)
        ?.map((e) => e == null
            ? null
            : DocumentsGroupModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$_$_DocumentsModelToJson(_$_DocumentsModel instance) =>
    <String, dynamic>{
      'project_documents':
          instance.projectDocuments?.map((e) => e?.toJson())?.toList(),
      'personal_documents':
          instance.personalDocuments?.map((e) => e?.toJson())?.toList(),
      'other_documents':
          instance.otherDocuments?.map((e) => e?.toJson())?.toList(),
      'specification_documents':
          instance.specificationDocuments?.map((e) => e?.toJson())?.toList(),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
    };

_$_DocumentsGroupModel _$_$_DocumentsGroupModelFromJson(
    Map<String, dynamic> json) {
  return _$_DocumentsGroupModel(
    itemName: json['item_name'] as String,
    isAvailable: json['is_available'] as bool,
    downloadUrl: json['download_url'] as String,
    updatedBy: json['updated_by'] as String,
    updatedTimeStamp: dateTimeFromUTC(json['updated_at'] as String),
    createdTimeStamp: dateTimeFromUTC(json['created_at'] as String),
    documentReason: json['document_reason'] as String,
  );
}

Map<String, dynamic> _$_$_DocumentsGroupModelToJson(
        _$_DocumentsGroupModel instance) =>
    <String, dynamic>{
      'item_name': instance.itemName,
      'is_available': instance.isAvailable,
      'download_url': instance.downloadUrl,
      'updated_by': instance.updatedBy,
      'updated_at': dateTimeToUTC(instance.updatedTimeStamp),
      'created_at': dateTimeToUTC(instance.createdTimeStamp),
      'document_reason': instance.documentReason,
    };
