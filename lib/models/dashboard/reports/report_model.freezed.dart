// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ReportModel _$ReportModelFromJson(Map<String, dynamic> json) {
  return _ReportModel.fromJson(json);
}

/// @nodoc
class _$ReportModelTearOff {
  const _$ReportModelTearOff();

// ignore: unused_element
  _ReportModel call(
      {@JsonKey(name: JsonConstants.activeStages)
          List<ProjectStageModel> activeStages,
      @JsonKey(name: JsonConstants.completedStages)
          List<ProjectStageModel> completedStages,
      @JsonKey(name: JsonConstants.upcomingStages)
          List<ProjectStageModel> upcomingStages,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) {
    return _ReportModel(
      activeStages: activeStages,
      completedStages: completedStages,
      upcomingStages: upcomingStages,
      createdTimeStamp: createdTimeStamp,
      updatedTimeStamp: updatedTimeStamp,
    );
  }

// ignore: unused_element
  ReportModel fromJson(Map<String, Object> json) {
    return ReportModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ReportModel = _$ReportModelTearOff();

/// @nodoc
mixin _$ReportModel {
  @JsonKey(name: JsonConstants.activeStages)
  List<ProjectStageModel> get activeStages;
  @JsonKey(name: JsonConstants.completedStages)
  List<ProjectStageModel> get completedStages;
  @JsonKey(name: JsonConstants.upcomingStages)
  List<ProjectStageModel> get upcomingStages;
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $ReportModelCopyWith<ReportModel> get copyWith;
}

/// @nodoc
abstract class $ReportModelCopyWith<$Res> {
  factory $ReportModelCopyWith(
          ReportModel value, $Res Function(ReportModel) then) =
      _$ReportModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.activeStages)
          List<ProjectStageModel> activeStages,
      @JsonKey(name: JsonConstants.completedStages)
          List<ProjectStageModel> completedStages,
      @JsonKey(name: JsonConstants.upcomingStages)
          List<ProjectStageModel> upcomingStages,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});
}

/// @nodoc
class _$ReportModelCopyWithImpl<$Res> implements $ReportModelCopyWith<$Res> {
  _$ReportModelCopyWithImpl(this._value, this._then);

  final ReportModel _value;
  // ignore: unused_field
  final $Res Function(ReportModel) _then;

  @override
  $Res call({
    Object activeStages = freezed,
    Object completedStages = freezed,
    Object upcomingStages = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      activeStages: activeStages == freezed
          ? _value.activeStages
          : activeStages as List<ProjectStageModel>,
      completedStages: completedStages == freezed
          ? _value.completedStages
          : completedStages as List<ProjectStageModel>,
      upcomingStages: upcomingStages == freezed
          ? _value.upcomingStages
          : upcomingStages as List<ProjectStageModel>,
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
abstract class _$ReportModelCopyWith<$Res>
    implements $ReportModelCopyWith<$Res> {
  factory _$ReportModelCopyWith(
          _ReportModel value, $Res Function(_ReportModel) then) =
      __$ReportModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.activeStages)
          List<ProjectStageModel> activeStages,
      @JsonKey(name: JsonConstants.completedStages)
          List<ProjectStageModel> completedStages,
      @JsonKey(name: JsonConstants.upcomingStages)
          List<ProjectStageModel> upcomingStages,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});
}

/// @nodoc
class __$ReportModelCopyWithImpl<$Res> extends _$ReportModelCopyWithImpl<$Res>
    implements _$ReportModelCopyWith<$Res> {
  __$ReportModelCopyWithImpl(
      _ReportModel _value, $Res Function(_ReportModel) _then)
      : super(_value, (v) => _then(v as _ReportModel));

  @override
  _ReportModel get _value => super._value as _ReportModel;

  @override
  $Res call({
    Object activeStages = freezed,
    Object completedStages = freezed,
    Object upcomingStages = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
  }) {
    return _then(_ReportModel(
      activeStages: activeStages == freezed
          ? _value.activeStages
          : activeStages as List<ProjectStageModel>,
      completedStages: completedStages == freezed
          ? _value.completedStages
          : completedStages as List<ProjectStageModel>,
      upcomingStages: upcomingStages == freezed
          ? _value.upcomingStages
          : upcomingStages as List<ProjectStageModel>,
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
class _$_ReportModel implements _ReportModel {
  _$_ReportModel(
      {@JsonKey(name: JsonConstants.activeStages)
          this.activeStages,
      @JsonKey(name: JsonConstants.completedStages)
          this.completedStages,
      @JsonKey(name: JsonConstants.upcomingStages)
          this.upcomingStages,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.updatedTimeStamp});

  factory _$_ReportModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ReportModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.activeStages)
  final List<ProjectStageModel> activeStages;
  @override
  @JsonKey(name: JsonConstants.completedStages)
  final List<ProjectStageModel> completedStages;
  @override
  @JsonKey(name: JsonConstants.upcomingStages)
  final List<ProjectStageModel> upcomingStages;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  final DateTime updatedTimeStamp;

  @override
  String toString() {
    return 'ReportModel(activeStages: $activeStages, completedStages: $completedStages, upcomingStages: $upcomingStages, createdTimeStamp: $createdTimeStamp, updatedTimeStamp: $updatedTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ReportModel &&
            (identical(other.activeStages, activeStages) ||
                const DeepCollectionEquality()
                    .equals(other.activeStages, activeStages)) &&
            (identical(other.completedStages, completedStages) ||
                const DeepCollectionEquality()
                    .equals(other.completedStages, completedStages)) &&
            (identical(other.upcomingStages, upcomingStages) ||
                const DeepCollectionEquality()
                    .equals(other.upcomingStages, upcomingStages)) &&
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
      const DeepCollectionEquality().hash(activeStages) ^
      const DeepCollectionEquality().hash(completedStages) ^
      const DeepCollectionEquality().hash(upcomingStages) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(updatedTimeStamp);

  @JsonKey(ignore: true)
  @override
  _$ReportModelCopyWith<_ReportModel> get copyWith =>
      __$ReportModelCopyWithImpl<_ReportModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ReportModelToJson(this);
  }
}

abstract class _ReportModel implements ReportModel {
  factory _ReportModel(
      {@JsonKey(name: JsonConstants.activeStages)
          List<ProjectStageModel> activeStages,
      @JsonKey(name: JsonConstants.completedStages)
          List<ProjectStageModel> completedStages,
      @JsonKey(name: JsonConstants.upcomingStages)
          List<ProjectStageModel> upcomingStages,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updatedAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) = _$_ReportModel;

  factory _ReportModel.fromJson(Map<String, dynamic> json) =
      _$_ReportModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.activeStages)
  List<ProjectStageModel> get activeStages;
  @override
  @JsonKey(name: JsonConstants.completedStages)
  List<ProjectStageModel> get completedStages;
  @override
  @JsonKey(name: JsonConstants.upcomingStages)
  List<ProjectStageModel> get upcomingStages;
  @override
  @JsonKey(
      name: JsonConstants.createdAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get createdTimeStamp;
  @override
  @JsonKey(
      name: JsonConstants.updatedAt,
      fromJson: dateTimeFromUTC,
      toJson: dateTimeToUTC)
  DateTime get updatedTimeStamp;
  @override
  @JsonKey(ignore: true)
  _$ReportModelCopyWith<_ReportModel> get copyWith;
}
