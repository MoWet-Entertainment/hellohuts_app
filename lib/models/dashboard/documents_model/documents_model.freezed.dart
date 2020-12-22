// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'documents_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
DocumentsModel _$DocumentsModelFromJson(Map<String, dynamic> json) {
  return _DocumentsModel.fromJson(json);
}

/// @nodoc
class _$DocumentsModelTearOff {
  const _$DocumentsModelTearOff();

// ignore: unused_element
  _DocumentsModel call(
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
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) {
    return _DocumentsModel(
      projectDocuments: projectDocuments,
      personalDocuments: personalDocuments,
      otherDocuments: otherDocuments,
      specificationDocuments: specificationDocuments,
      createdTimeStamp: createdTimeStamp,
      updatedTimeStamp: updatedTimeStamp,
    );
  }

// ignore: unused_element
  DocumentsModel fromJson(Map<String, Object> json) {
    return DocumentsModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DocumentsModel = _$DocumentsModelTearOff();

/// @nodoc
mixin _$DocumentsModel {
  @JsonKey(name: JsonConstants.projectDocuments)
  List<DocumentsGroupModel> get projectDocuments;
  @JsonKey(name: JsonConstants.personalDocuments)
  List<DocumentsGroupModel> get personalDocuments;
  @JsonKey(name: JsonConstants.otherDocuments)
  List<DocumentsGroupModel> get otherDocuments;
  @JsonKey(name: JsonConstants.specificationDocuments)
  List<DocumentsGroupModel> get specificationDocuments;
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;

  Map<String, dynamic> toJson();
  $DocumentsModelCopyWith<DocumentsModel> get copyWith;
}

/// @nodoc
abstract class $DocumentsModelCopyWith<$Res> {
  factory $DocumentsModelCopyWith(
          DocumentsModel value, $Res Function(DocumentsModel) then) =
      _$DocumentsModelCopyWithImpl<$Res>;
  $Res call(
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
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});
}

/// @nodoc
class _$DocumentsModelCopyWithImpl<$Res>
    implements $DocumentsModelCopyWith<$Res> {
  _$DocumentsModelCopyWithImpl(this._value, this._then);

  final DocumentsModel _value;
  // ignore: unused_field
  final $Res Function(DocumentsModel) _then;

  @override
  $Res call({
    Object projectDocuments = freezed,
    Object personalDocuments = freezed,
    Object otherDocuments = freezed,
    Object specificationDocuments = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      projectDocuments: projectDocuments == freezed
          ? _value.projectDocuments
          : projectDocuments as List<DocumentsGroupModel>,
      personalDocuments: personalDocuments == freezed
          ? _value.personalDocuments
          : personalDocuments as List<DocumentsGroupModel>,
      otherDocuments: otherDocuments == freezed
          ? _value.otherDocuments
          : otherDocuments as List<DocumentsGroupModel>,
      specificationDocuments: specificationDocuments == freezed
          ? _value.specificationDocuments
          : specificationDocuments as List<DocumentsGroupModel>,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$DocumentsModelCopyWith<$Res>
    implements $DocumentsModelCopyWith<$Res> {
  factory _$DocumentsModelCopyWith(
          _DocumentsModel value, $Res Function(_DocumentsModel) then) =
      __$DocumentsModelCopyWithImpl<$Res>;
  @override
  $Res call(
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
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});
}

/// @nodoc
class __$DocumentsModelCopyWithImpl<$Res>
    extends _$DocumentsModelCopyWithImpl<$Res>
    implements _$DocumentsModelCopyWith<$Res> {
  __$DocumentsModelCopyWithImpl(
      _DocumentsModel _value, $Res Function(_DocumentsModel) _then)
      : super(_value, (v) => _then(v as _DocumentsModel));

  @override
  _DocumentsModel get _value => super._value as _DocumentsModel;

  @override
  $Res call({
    Object projectDocuments = freezed,
    Object personalDocuments = freezed,
    Object otherDocuments = freezed,
    Object specificationDocuments = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
  }) {
    return _then(_DocumentsModel(
      projectDocuments: projectDocuments == freezed
          ? _value.projectDocuments
          : projectDocuments as List<DocumentsGroupModel>,
      personalDocuments: personalDocuments == freezed
          ? _value.personalDocuments
          : personalDocuments as List<DocumentsGroupModel>,
      otherDocuments: otherDocuments == freezed
          ? _value.otherDocuments
          : otherDocuments as List<DocumentsGroupModel>,
      specificationDocuments: specificationDocuments == freezed
          ? _value.specificationDocuments
          : specificationDocuments as List<DocumentsGroupModel>,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_DocumentsModel implements _DocumentsModel {
  _$_DocumentsModel(
      {@JsonKey(name: JsonConstants.projectDocuments)
          this.projectDocuments,
      @JsonKey(name: JsonConstants.personalDocuments)
          this.personalDocuments,
      @JsonKey(name: JsonConstants.otherDocuments)
          this.otherDocuments,
      @JsonKey(name: JsonConstants.specificationDocuments)
          this.specificationDocuments,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.updatedTimeStamp});

  factory _$_DocumentsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DocumentsModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.projectDocuments)
  final List<DocumentsGroupModel> projectDocuments;
  @override
  @JsonKey(name: JsonConstants.personalDocuments)
  final List<DocumentsGroupModel> personalDocuments;
  @override
  @JsonKey(name: JsonConstants.otherDocuments)
  final List<DocumentsGroupModel> otherDocuments;
  @override
  @JsonKey(name: JsonConstants.specificationDocuments)
  final List<DocumentsGroupModel> specificationDocuments;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime updatedTimeStamp;

  @override
  String toString() {
    return 'DocumentsModel(projectDocuments: $projectDocuments, personalDocuments: $personalDocuments, otherDocuments: $otherDocuments, specificationDocuments: $specificationDocuments, createdTimeStamp: $createdTimeStamp, updatedTimeStamp: $updatedTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DocumentsModel &&
            (identical(other.projectDocuments, projectDocuments) ||
                const DeepCollectionEquality()
                    .equals(other.projectDocuments, projectDocuments)) &&
            (identical(other.personalDocuments, personalDocuments) ||
                const DeepCollectionEquality()
                    .equals(other.personalDocuments, personalDocuments)) &&
            (identical(other.otherDocuments, otherDocuments) ||
                const DeepCollectionEquality()
                    .equals(other.otherDocuments, otherDocuments)) &&
            (identical(other.specificationDocuments, specificationDocuments) ||
                const DeepCollectionEquality().equals(
                    other.specificationDocuments, specificationDocuments)) &&
            (identical(other.createdTimeStamp, createdTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.createdTimeStamp, createdTimeStamp)) &&
            (identical(other.updatedTimeStamp, updatedTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTimeStamp, updatedTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projectDocuments) ^
      const DeepCollectionEquality().hash(personalDocuments) ^
      const DeepCollectionEquality().hash(otherDocuments) ^
      const DeepCollectionEquality().hash(specificationDocuments) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(updatedTimeStamp);

  @override
  _$DocumentsModelCopyWith<_DocumentsModel> get copyWith =>
      __$DocumentsModelCopyWithImpl<_DocumentsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DocumentsModelToJson(this);
  }
}

abstract class _DocumentsModel implements DocumentsModel {
  factory _DocumentsModel(
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
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) = _$_DocumentsModel;

  factory _DocumentsModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentsModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.projectDocuments)
  List<DocumentsGroupModel> get projectDocuments;
  @override
  @JsonKey(name: JsonConstants.personalDocuments)
  List<DocumentsGroupModel> get personalDocuments;
  @override
  @JsonKey(name: JsonConstants.otherDocuments)
  List<DocumentsGroupModel> get otherDocuments;
  @override
  @JsonKey(name: JsonConstants.specificationDocuments)
  List<DocumentsGroupModel> get specificationDocuments;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @override
  _$DocumentsModelCopyWith<_DocumentsModel> get copyWith;
}

DocumentsGroupModel _$DocumentsGroupModelFromJson(Map<String, dynamic> json) {
  return _DocumentsGroupModel.fromJson(json);
}

/// @nodoc
class _$DocumentsGroupModelTearOff {
  const _$DocumentsGroupModelTearOff();

// ignore: unused_element
  _DocumentsGroupModel call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.isAvailable)
          bool isAvailable,
      @JsonKey(name: JsonConstants.downloadUrl)
          String downloadUrl,
      @JsonKey(ignore: true)
          bool isDownloaded,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.documentReason)
          String documentReason}) {
    return _DocumentsGroupModel(
      itemName: itemName,
      isAvailable: isAvailable,
      downloadUrl: downloadUrl,
      isDownloaded: isDownloaded,
      updatedBy: updatedBy,
      updatedTimeStamp: updatedTimeStamp,
      createdTimeStamp: createdTimeStamp,
      documentReason: documentReason,
    );
  }

// ignore: unused_element
  DocumentsGroupModel fromJson(Map<String, Object> json) {
    return DocumentsGroupModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $DocumentsGroupModel = _$DocumentsGroupModelTearOff();

/// @nodoc
mixin _$DocumentsGroupModel {
  @JsonKey(name: JsonConstants.itemName)
  String get itemName;
  @JsonKey(name: JsonConstants.isAvailable)
  bool get isAvailable;
  @JsonKey(name: JsonConstants.downloadUrl)
  String get downloadUrl;
  @JsonKey(ignore: true)
  bool get isDownloaded;
  @JsonKey(name: JsonConstants.updatedBy)
  String get updatedBy;
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @JsonKey(name: JsonConstants.documentReason)
  String get documentReason;

  Map<String, dynamic> toJson();
  $DocumentsGroupModelCopyWith<DocumentsGroupModel> get copyWith;
}

/// @nodoc
abstract class $DocumentsGroupModelCopyWith<$Res> {
  factory $DocumentsGroupModelCopyWith(
          DocumentsGroupModel value, $Res Function(DocumentsGroupModel) then) =
      _$DocumentsGroupModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.isAvailable)
          bool isAvailable,
      @JsonKey(name: JsonConstants.downloadUrl)
          String downloadUrl,
      @JsonKey(ignore: true)
          bool isDownloaded,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.documentReason)
          String documentReason});
}

/// @nodoc
class _$DocumentsGroupModelCopyWithImpl<$Res>
    implements $DocumentsGroupModelCopyWith<$Res> {
  _$DocumentsGroupModelCopyWithImpl(this._value, this._then);

  final DocumentsGroupModel _value;
  // ignore: unused_field
  final $Res Function(DocumentsGroupModel) _then;

  @override
  $Res call({
    Object itemName = freezed,
    Object isAvailable = freezed,
    Object downloadUrl = freezed,
    Object isDownloaded = freezed,
    Object updatedBy = freezed,
    Object updatedTimeStamp = freezed,
    Object createdTimeStamp = freezed,
    Object documentReason = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      isAvailable:
          isAvailable == freezed ? _value.isAvailable : isAvailable as bool,
      downloadUrl:
          downloadUrl == freezed ? _value.downloadUrl : downloadUrl as String,
      isDownloaded:
          isDownloaded == freezed ? _value.isDownloaded : isDownloaded as bool,
      updatedBy: updatedBy == freezed ? _value.updatedBy : updatedBy as String,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      documentReason: documentReason == freezed
          ? _value.documentReason
          : documentReason as String,
    ));
  }
}

/// @nodoc
abstract class _$DocumentsGroupModelCopyWith<$Res>
    implements $DocumentsGroupModelCopyWith<$Res> {
  factory _$DocumentsGroupModelCopyWith(_DocumentsGroupModel value,
          $Res Function(_DocumentsGroupModel) then) =
      __$DocumentsGroupModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.isAvailable)
          bool isAvailable,
      @JsonKey(name: JsonConstants.downloadUrl)
          String downloadUrl,
      @JsonKey(ignore: true)
          bool isDownloaded,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.documentReason)
          String documentReason});
}

/// @nodoc
class __$DocumentsGroupModelCopyWithImpl<$Res>
    extends _$DocumentsGroupModelCopyWithImpl<$Res>
    implements _$DocumentsGroupModelCopyWith<$Res> {
  __$DocumentsGroupModelCopyWithImpl(
      _DocumentsGroupModel _value, $Res Function(_DocumentsGroupModel) _then)
      : super(_value, (v) => _then(v as _DocumentsGroupModel));

  @override
  _DocumentsGroupModel get _value => super._value as _DocumentsGroupModel;

  @override
  $Res call({
    Object itemName = freezed,
    Object isAvailable = freezed,
    Object downloadUrl = freezed,
    Object isDownloaded = freezed,
    Object updatedBy = freezed,
    Object updatedTimeStamp = freezed,
    Object createdTimeStamp = freezed,
    Object documentReason = freezed,
  }) {
    return _then(_DocumentsGroupModel(
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      isAvailable:
          isAvailable == freezed ? _value.isAvailable : isAvailable as bool,
      downloadUrl:
          downloadUrl == freezed ? _value.downloadUrl : downloadUrl as String,
      isDownloaded:
          isDownloaded == freezed ? _value.isDownloaded : isDownloaded as bool,
      updatedBy: updatedBy == freezed ? _value.updatedBy : updatedBy as String,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      documentReason: documentReason == freezed
          ? _value.documentReason
          : documentReason as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_DocumentsGroupModel implements _DocumentsGroupModel {
  _$_DocumentsGroupModel(
      {@JsonKey(name: JsonConstants.itemName)
          this.itemName,
      @JsonKey(name: JsonConstants.isAvailable)
          this.isAvailable,
      @JsonKey(name: JsonConstants.downloadUrl)
          this.downloadUrl,
      @JsonKey(ignore: true)
          this.isDownloaded,
      @JsonKey(name: JsonConstants.updatedBy)
          this.updatedBy,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.documentReason)
          this.documentReason});

  factory _$_DocumentsGroupModel.fromJson(Map<String, dynamic> json) =>
      _$_$_DocumentsGroupModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.itemName)
  final String itemName;
  @override
  @JsonKey(name: JsonConstants.isAvailable)
  final bool isAvailable;
  @override
  @JsonKey(name: JsonConstants.downloadUrl)
  final String downloadUrl;
  @override
  @JsonKey(ignore: true)
  final bool isDownloaded;
  @override
  @JsonKey(name: JsonConstants.updatedBy)
  final String updatedBy;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime updatedTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime createdTimeStamp;
  @override
  @JsonKey(name: JsonConstants.documentReason)
  final String documentReason;

  @override
  String toString() {
    return 'DocumentsGroupModel(itemName: $itemName, isAvailable: $isAvailable, downloadUrl: $downloadUrl, isDownloaded: $isDownloaded, updatedBy: $updatedBy, updatedTimeStamp: $updatedTimeStamp, createdTimeStamp: $createdTimeStamp, documentReason: $documentReason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _DocumentsGroupModel &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.isAvailable, isAvailable) ||
                const DeepCollectionEquality()
                    .equals(other.isAvailable, isAvailable)) &&
            (identical(other.downloadUrl, downloadUrl) ||
                const DeepCollectionEquality()
                    .equals(other.downloadUrl, downloadUrl)) &&
            (identical(other.isDownloaded, isDownloaded) ||
                const DeepCollectionEquality()
                    .equals(other.isDownloaded, isDownloaded)) &&
            (identical(other.updatedBy, updatedBy) ||
                const DeepCollectionEquality()
                    .equals(other.updatedBy, updatedBy)) &&
            (identical(other.updatedTimeStamp, updatedTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.updatedTimeStamp, updatedTimeStamp)) &&
            (identical(other.createdTimeStamp, createdTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.createdTimeStamp, createdTimeStamp)) &&
            (identical(other.documentReason, documentReason) ||
                const DeepCollectionEquality()
                    .equals(other.documentReason, documentReason)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(isAvailable) ^
      const DeepCollectionEquality().hash(downloadUrl) ^
      const DeepCollectionEquality().hash(isDownloaded) ^
      const DeepCollectionEquality().hash(updatedBy) ^
      const DeepCollectionEquality().hash(updatedTimeStamp) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(documentReason);

  @override
  _$DocumentsGroupModelCopyWith<_DocumentsGroupModel> get copyWith =>
      __$DocumentsGroupModelCopyWithImpl<_DocumentsGroupModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DocumentsGroupModelToJson(this);
  }
}

abstract class _DocumentsGroupModel implements DocumentsGroupModel {
  factory _DocumentsGroupModel(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.isAvailable)
          bool isAvailable,
      @JsonKey(name: JsonConstants.downloadUrl)
          String downloadUrl,
      @JsonKey(ignore: true)
          bool isDownloaded,
      @JsonKey(name: JsonConstants.updatedBy)
          String updatedBy,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.documentReason)
          String documentReason}) = _$_DocumentsGroupModel;

  factory _DocumentsGroupModel.fromJson(Map<String, dynamic> json) =
      _$_DocumentsGroupModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.itemName)
  String get itemName;
  @override
  @JsonKey(name: JsonConstants.isAvailable)
  bool get isAvailable;
  @override
  @JsonKey(name: JsonConstants.downloadUrl)
  String get downloadUrl;
  @override
  @JsonKey(ignore: true)
  bool get isDownloaded;
  @override
  @JsonKey(name: JsonConstants.updatedBy)
  String get updatedBy;
  @override
  @JsonKey(
      name: JsonConstants.updated_at,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @override
  @JsonKey(name: JsonConstants.documentReason)
  String get documentReason;
  @override
  _$DocumentsGroupModelCopyWith<_DocumentsGroupModel> get copyWith;
}
