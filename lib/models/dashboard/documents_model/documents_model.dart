import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/helper/utilities.dart';
part 'documents_model.freezed.dart';
part 'documents_model.g.dart';

enum DocumentsType {
  ProjectDrawing,
  WarrantyCard,
  BillStatement,
  ProjectApproval,
  Specifications,
  PersonalDoc,
}

@freezed
abstract class DocumentsModel with _$DocumentsModel {
  @JsonSerializable(explicitToJson: true)
  factory DocumentsModel(
      {@JsonKey(name: JsonConstants.projectDocuments)
          List<DocumentsGroupModel> projectDocuments,
      @JsonKey(name: JsonConstants.personalDocuments)
          List<DocumentsGroupModel> personalDocuments,
      @JsonKey(name: JsonConstants.otherDocuments)
          List<DocumentsGroupModel> otherDocuments,
      @JsonKey(name: JsonConstants.specificationDocuments)
          List<DocumentsGroupModel> specificationDocuments,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) = _DocumentsModel;

  factory DocumentsModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentsModelFromJson(json);

  factory DocumentsModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return DocumentsModel.fromJson(json);
  }
}

@freezed
abstract class DocumentsGroupModel with _$DocumentsGroupModel {
  @JsonSerializable(explicitToJson: true)
  factory DocumentsGroupModel({
    @JsonKey(name: JsonConstants.itemName) String itemName,
    @JsonKey(name: JsonConstants.isAvailable) bool isAvailable,
    @JsonKey(name: JsonConstants.itemType, fromJson: DocumentsGroupModel._setDocumentType, toJson: DocumentsGroupModel._getDocumentType)
        DocumentsType documentsType,
    @JsonKey(name: JsonConstants.downloadUrl) String downloadUrl,
    @JsonKey(ignore: true) bool isDownloaded,
    @JsonKey(name: JsonConstants.updatedBy) String updatedBy,
    @JsonKey(name: JsonConstants.providedBy) String provideBy,
    @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
    @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.documentReason) String documentReason,
  }) = _DocumentsGroupModel;

  factory DocumentsGroupModel.fromJson(Map<String, dynamic> json) =>
      _$DocumentsGroupModelFromJson(json);

  factory DocumentsGroupModel.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return DocumentsGroupModel.fromJson(json);
  }
  static DocumentsType _setDocumentType(String dataVal) {
    if (dataVal == JsonConstants.projectDrawing) {
      return DocumentsType.ProjectDrawing;
    } else if (dataVal == JsonConstants.warrantyCard) {
      return DocumentsType.WarrantyCard;
    } else if (dataVal == JsonConstants.billStatement) {
      return DocumentsType.BillStatement;
    } else if (dataVal == JsonConstants.projectApproval) {
      return DocumentsType.ProjectApproval;
    } else if (dataVal == JsonConstants.specification) {
      return DocumentsType.Specifications;
    } else if (dataVal == JsonConstants.personalDoc) {
      return DocumentsType.PersonalDoc;
    }
    return null;
  }

  static String _getDocumentType(DocumentsType type) {
    if (type == DocumentsType.ProjectDrawing) {
      return JsonConstants.projectDrawing;
    } else if (type == DocumentsType.WarrantyCard) {
      return JsonConstants.warrantyCard;
    } else if (type == DocumentsType.BillStatement) {
      return JsonConstants.billStatement;
    } else if (type == DocumentsType.ProjectApproval) {
      return JsonConstants.projectApproval;
    } else if (type == DocumentsType.Specifications) {
      return JsonConstants.specification;
    } else if (type == DocumentsType.PersonalDoc) {
      return JsonConstants.personalDoc;
    }
    return "";
  }
}
