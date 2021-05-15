// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'project_stage_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProjectStageModel _$ProjectStageModelFromJson(Map<String, dynamic> json) {
  return _ProjectStageModel.fromJson(json);
}

/// @nodoc
class _$ProjectStageModelTearOff {
  const _$ProjectStageModelTearOff();

// ignore: unused_element
  _ProjectStageModel call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.itemImage)
          String itemImage,
      @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
          Stages currentStage,
      @JsonKey(name: JsonConstants.date, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime date,
      @JsonKey(nullable: true, name: JsonConstants.estimatedDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime estimatedDate,
      @JsonKey(nullable: true, name: JsonConstants.actualDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime actualDate}) {
    return _ProjectStageModel(
      itemName: itemName,
      itemImage: itemImage,
      currentStage: currentStage,
      date: date,
      estimatedDate: estimatedDate,
      actualDate: actualDate,
    );
  }

// ignore: unused_element
  ProjectStageModel fromJson(Map<String, Object> json) {
    return ProjectStageModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProjectStageModel = _$ProjectStageModelTearOff();

/// @nodoc
mixin _$ProjectStageModel {
  @JsonKey(name: JsonConstants.itemName)
  String get itemName;
  @JsonKey(name: JsonConstants.itemImage)
  String get itemImage;
  @JsonKey(
      name: JsonConstants.currentStage,
      fromJson: ProjectStageModel._setCurrentStage,
      toJson: ProjectStageModel._getCurrentStage)
  Stages get currentStage;
  @JsonKey(
      name: JsonConstants.date,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get date;
  @JsonKey(
      nullable: true,
      name: JsonConstants.estimatedDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get estimatedDate;
  @JsonKey(
      nullable: true,
      name: JsonConstants.actualDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get actualDate;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ProjectStageModelCopyWith<ProjectStageModel> get copyWith;
}

/// @nodoc
abstract class $ProjectStageModelCopyWith<$Res> {
  factory $ProjectStageModelCopyWith(
          ProjectStageModel value, $Res Function(ProjectStageModel) then) =
      _$ProjectStageModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.itemImage)
          String itemImage,
      @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
          Stages currentStage,
      @JsonKey(name: JsonConstants.date, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime date,
      @JsonKey(nullable: true, name: JsonConstants.estimatedDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime estimatedDate,
      @JsonKey(nullable: true, name: JsonConstants.actualDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime actualDate});
}

/// @nodoc
class _$ProjectStageModelCopyWithImpl<$Res>
    implements $ProjectStageModelCopyWith<$Res> {
  _$ProjectStageModelCopyWithImpl(this._value, this._then);

  final ProjectStageModel _value;
  // ignore: unused_field
  final $Res Function(ProjectStageModel) _then;

  @override
  $Res call({
    Object itemName = freezed,
    Object itemImage = freezed,
    Object currentStage = freezed,
    Object date = freezed,
    Object estimatedDate = freezed,
    Object actualDate = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      itemImage: itemImage == freezed ? _value.itemImage : itemImage as String,
      currentStage: currentStage == freezed
          ? _value.currentStage
          : currentStage as Stages,
      date: date == freezed ? _value.date : date as DateTime,
      estimatedDate: estimatedDate == freezed
          ? _value.estimatedDate
          : estimatedDate as DateTime,
      actualDate:
          actualDate == freezed ? _value.actualDate : actualDate as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$ProjectStageModelCopyWith<$Res>
    implements $ProjectStageModelCopyWith<$Res> {
  factory _$ProjectStageModelCopyWith(
          _ProjectStageModel value, $Res Function(_ProjectStageModel) then) =
      __$ProjectStageModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.itemImage)
          String itemImage,
      @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
          Stages currentStage,
      @JsonKey(name: JsonConstants.date, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime date,
      @JsonKey(nullable: true, name: JsonConstants.estimatedDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime estimatedDate,
      @JsonKey(nullable: true, name: JsonConstants.actualDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime actualDate});
}

/// @nodoc
class __$ProjectStageModelCopyWithImpl<$Res>
    extends _$ProjectStageModelCopyWithImpl<$Res>
    implements _$ProjectStageModelCopyWith<$Res> {
  __$ProjectStageModelCopyWithImpl(
      _ProjectStageModel _value, $Res Function(_ProjectStageModel) _then)
      : super(_value, (v) => _then(v as _ProjectStageModel));

  @override
  _ProjectStageModel get _value => super._value as _ProjectStageModel;

  @override
  $Res call({
    Object itemName = freezed,
    Object itemImage = freezed,
    Object currentStage = freezed,
    Object date = freezed,
    Object estimatedDate = freezed,
    Object actualDate = freezed,
  }) {
    return _then(_ProjectStageModel(
      itemName: itemName == freezed ? _value.itemName : itemName as String,
      itemImage: itemImage == freezed ? _value.itemImage : itemImage as String,
      currentStage: currentStage == freezed
          ? _value.currentStage
          : currentStage as Stages,
      date: date == freezed ? _value.date : date as DateTime,
      estimatedDate: estimatedDate == freezed
          ? _value.estimatedDate
          : estimatedDate as DateTime,
      actualDate:
          actualDate == freezed ? _value.actualDate : actualDate as DateTime,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_ProjectStageModel implements _ProjectStageModel {
  _$_ProjectStageModel(
      {@JsonKey(name: JsonConstants.itemName)
          this.itemName,
      @JsonKey(name: JsonConstants.itemImage)
          this.itemImage,
      @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
          this.currentStage,
      @JsonKey(name: JsonConstants.date, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.date,
      @JsonKey(nullable: true, name: JsonConstants.estimatedDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.estimatedDate,
      @JsonKey(nullable: true, name: JsonConstants.actualDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.actualDate});

  factory _$_ProjectStageModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProjectStageModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.itemName)
  final String itemName;
  @override
  @JsonKey(name: JsonConstants.itemImage)
  final String itemImage;
  @override
  @JsonKey(
      name: JsonConstants.currentStage,
      fromJson: ProjectStageModel._setCurrentStage,
      toJson: ProjectStageModel._getCurrentStage)
  final Stages currentStage;
  @override
  @JsonKey(
      name: JsonConstants.date,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime date;
  @override
  @JsonKey(
      nullable: true,
      name: JsonConstants.estimatedDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime estimatedDate;
  @override
  @JsonKey(
      nullable: true,
      name: JsonConstants.actualDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime actualDate;

  @override
  String toString() {
    return 'ProjectStageModel(itemName: $itemName, itemImage: $itemImage, currentStage: $currentStage, date: $date, estimatedDate: $estimatedDate, actualDate: $actualDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProjectStageModel &&
            (identical(other.itemName, itemName) ||
                const DeepCollectionEquality()
                    .equals(other.itemName, itemName)) &&
            (identical(other.itemImage, itemImage) ||
                const DeepCollectionEquality()
                    .equals(other.itemImage, itemImage)) &&
            (identical(other.currentStage, currentStage) ||
                const DeepCollectionEquality()
                    .equals(other.currentStage, currentStage)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.estimatedDate, estimatedDate) ||
                const DeepCollectionEquality()
                    .equals(other.estimatedDate, estimatedDate)) &&
            (identical(other.actualDate, actualDate) ||
                const DeepCollectionEquality()
                    .equals(other.actualDate, actualDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(itemName) ^
      const DeepCollectionEquality().hash(itemImage) ^
      const DeepCollectionEquality().hash(currentStage) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(estimatedDate) ^
      const DeepCollectionEquality().hash(actualDate);

  @JsonKey(ignore: true)
  @override
  _$ProjectStageModelCopyWith<_ProjectStageModel> get copyWith =>
      __$ProjectStageModelCopyWithImpl<_ProjectStageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProjectStageModelToJson(this);
  }
}

abstract class _ProjectStageModel implements ProjectStageModel {
  factory _ProjectStageModel(
      {@JsonKey(name: JsonConstants.itemName)
          String itemName,
      @JsonKey(name: JsonConstants.itemImage)
          String itemImage,
      @JsonKey(name: JsonConstants.currentStage, fromJson: ProjectStageModel._setCurrentStage, toJson: ProjectStageModel._getCurrentStage)
          Stages currentStage,
      @JsonKey(name: JsonConstants.date, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime date,
      @JsonKey(nullable: true, name: JsonConstants.estimatedDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime estimatedDate,
      @JsonKey(nullable: true, name: JsonConstants.actualDate, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime actualDate}) = _$_ProjectStageModel;

  factory _ProjectStageModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectStageModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.itemName)
  String get itemName;
  @override
  @JsonKey(name: JsonConstants.itemImage)
  String get itemImage;
  @override
  @JsonKey(
      name: JsonConstants.currentStage,
      fromJson: ProjectStageModel._setCurrentStage,
      toJson: ProjectStageModel._getCurrentStage)
  Stages get currentStage;
  @override
  @JsonKey(
      name: JsonConstants.date,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get date;
  @override
  @JsonKey(
      nullable: true,
      name: JsonConstants.estimatedDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get estimatedDate;
  @override
  @JsonKey(
      nullable: true,
      name: JsonConstants.actualDate,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get actualDate;
  @override
  @JsonKey(ignore: true)
  _$ProjectStageModelCopyWith<_ProjectStageModel> get copyWith;
}
