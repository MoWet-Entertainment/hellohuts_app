// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'project_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ProjectDetailsModel _$ProjectDetailsModelFromJson(Map<String, dynamic> json) {
  return _ProjectDetailsModel.fromJson(json);
}

/// @nodoc
class _$ProjectDetailsModelTearOff {
  const _$ProjectDetailsModelTearOff();

// ignore: unused_element
  _ProjectDetailsModel call(
      {@JsonKey(name: JsonConstants.project_area)
          String projectArea,
      @JsonKey(name: JsonConstants.plinth_area)
          String plinthArea,
      @JsonKey(name: JsonConstants.projectEstimate)
          String projectEstimate,
      @JsonKey(name: JsonConstants.projectTotalPaid)
          String projectTotalPaid,
      @JsonKey(name: JsonConstants.projectStartDate)
          String projectStartDate,
      @JsonKey(name: JsonConstants.projectDateOfCompletion)
          String projectDateOfCompletion,
      String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress}) {
    return _ProjectDetailsModel(
      projectArea: projectArea,
      plinthArea: plinthArea,
      projectEstimate: projectEstimate,
      projectTotalPaid: projectTotalPaid,
      projectStartDate: projectStartDate,
      projectDateOfCompletion: projectDateOfCompletion,
      projectEstDateOfCompletion: projectEstDateOfCompletion,
      percentageOfCompletion: percentageOfCompletion,
      projectEngineer: projectEngineer,
      contractor: contractor,
      projectAddress: projectAddress,
    );
  }

// ignore: unused_element
  ProjectDetailsModel fromJson(Map<String, Object> json) {
    return ProjectDetailsModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ProjectDetailsModel = _$ProjectDetailsModelTearOff();

/// @nodoc
mixin _$ProjectDetailsModel {
  @JsonKey(name: JsonConstants.project_area)
  String get projectArea;
  @JsonKey(name: JsonConstants.plinth_area)
  String get plinthArea;
  @JsonKey(name: JsonConstants.projectEstimate)
  String get projectEstimate;
  @JsonKey(name: JsonConstants.projectTotalPaid)
  String get projectTotalPaid;
  @JsonKey(name: JsonConstants.projectStartDate)
  String get projectStartDate;
  @JsonKey(name: JsonConstants.projectDateOfCompletion)
  String get projectDateOfCompletion;
  String get projectEstDateOfCompletion;
  @JsonKey(name: JsonConstants.projectCompletionPercentage)
  String get percentageOfCompletion;
  @JsonKey(name: JsonConstants.projectEngineer)
  EngineerModel get projectEngineer;
  @JsonKey(name: JsonConstants.contractor)
  ContractorModel get contractor;
  @JsonKey(name: JsonConstants.projectAddress)
  Address get projectAddress;

  Map<String, dynamic> toJson();
  $ProjectDetailsModelCopyWith<ProjectDetailsModel> get copyWith;
}

/// @nodoc
abstract class $ProjectDetailsModelCopyWith<$Res> {
  factory $ProjectDetailsModelCopyWith(
          ProjectDetailsModel value, $Res Function(ProjectDetailsModel) then) =
      _$ProjectDetailsModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.project_area)
          String projectArea,
      @JsonKey(name: JsonConstants.plinth_area)
          String plinthArea,
      @JsonKey(name: JsonConstants.projectEstimate)
          String projectEstimate,
      @JsonKey(name: JsonConstants.projectTotalPaid)
          String projectTotalPaid,
      @JsonKey(name: JsonConstants.projectStartDate)
          String projectStartDate,
      @JsonKey(name: JsonConstants.projectDateOfCompletion)
          String projectDateOfCompletion,
      String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress});

  $EngineerModelCopyWith<$Res> get projectEngineer;
  $ContractorModelCopyWith<$Res> get contractor;
  $AddressCopyWith<$Res> get projectAddress;
}

/// @nodoc
class _$ProjectDetailsModelCopyWithImpl<$Res>
    implements $ProjectDetailsModelCopyWith<$Res> {
  _$ProjectDetailsModelCopyWithImpl(this._value, this._then);

  final ProjectDetailsModel _value;
  // ignore: unused_field
  final $Res Function(ProjectDetailsModel) _then;

  @override
  $Res call({
    Object projectArea = freezed,
    Object plinthArea = freezed,
    Object projectEstimate = freezed,
    Object projectTotalPaid = freezed,
    Object projectStartDate = freezed,
    Object projectDateOfCompletion = freezed,
    Object projectEstDateOfCompletion = freezed,
    Object percentageOfCompletion = freezed,
    Object projectEngineer = freezed,
    Object contractor = freezed,
    Object projectAddress = freezed,
  }) {
    return _then(_value.copyWith(
      projectArea:
          projectArea == freezed ? _value.projectArea : projectArea as String,
      plinthArea:
          plinthArea == freezed ? _value.plinthArea : plinthArea as String,
      projectEstimate: projectEstimate == freezed
          ? _value.projectEstimate
          : projectEstimate as String,
      projectTotalPaid: projectTotalPaid == freezed
          ? _value.projectTotalPaid
          : projectTotalPaid as String,
      projectStartDate: projectStartDate == freezed
          ? _value.projectStartDate
          : projectStartDate as String,
      projectDateOfCompletion: projectDateOfCompletion == freezed
          ? _value.projectDateOfCompletion
          : projectDateOfCompletion as String,
      projectEstDateOfCompletion: projectEstDateOfCompletion == freezed
          ? _value.projectEstDateOfCompletion
          : projectEstDateOfCompletion as String,
      percentageOfCompletion: percentageOfCompletion == freezed
          ? _value.percentageOfCompletion
          : percentageOfCompletion as String,
      projectEngineer: projectEngineer == freezed
          ? _value.projectEngineer
          : projectEngineer as EngineerModel,
      contractor: contractor == freezed
          ? _value.contractor
          : contractor as ContractorModel,
      projectAddress: projectAddress == freezed
          ? _value.projectAddress
          : projectAddress as Address,
    ));
  }

  @override
  $EngineerModelCopyWith<$Res> get projectEngineer {
    if (_value.projectEngineer == null) {
      return null;
    }
    return $EngineerModelCopyWith<$Res>(_value.projectEngineer, (value) {
      return _then(_value.copyWith(projectEngineer: value));
    });
  }

  @override
  $ContractorModelCopyWith<$Res> get contractor {
    if (_value.contractor == null) {
      return null;
    }
    return $ContractorModelCopyWith<$Res>(_value.contractor, (value) {
      return _then(_value.copyWith(contractor: value));
    });
  }

  @override
  $AddressCopyWith<$Res> get projectAddress {
    if (_value.projectAddress == null) {
      return null;
    }
    return $AddressCopyWith<$Res>(_value.projectAddress, (value) {
      return _then(_value.copyWith(projectAddress: value));
    });
  }
}

/// @nodoc
abstract class _$ProjectDetailsModelCopyWith<$Res>
    implements $ProjectDetailsModelCopyWith<$Res> {
  factory _$ProjectDetailsModelCopyWith(_ProjectDetailsModel value,
          $Res Function(_ProjectDetailsModel) then) =
      __$ProjectDetailsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.project_area)
          String projectArea,
      @JsonKey(name: JsonConstants.plinth_area)
          String plinthArea,
      @JsonKey(name: JsonConstants.projectEstimate)
          String projectEstimate,
      @JsonKey(name: JsonConstants.projectTotalPaid)
          String projectTotalPaid,
      @JsonKey(name: JsonConstants.projectStartDate)
          String projectStartDate,
      @JsonKey(name: JsonConstants.projectDateOfCompletion)
          String projectDateOfCompletion,
      String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress});

  @override
  $EngineerModelCopyWith<$Res> get projectEngineer;
  @override
  $ContractorModelCopyWith<$Res> get contractor;
  @override
  $AddressCopyWith<$Res> get projectAddress;
}

/// @nodoc
class __$ProjectDetailsModelCopyWithImpl<$Res>
    extends _$ProjectDetailsModelCopyWithImpl<$Res>
    implements _$ProjectDetailsModelCopyWith<$Res> {
  __$ProjectDetailsModelCopyWithImpl(
      _ProjectDetailsModel _value, $Res Function(_ProjectDetailsModel) _then)
      : super(_value, (v) => _then(v as _ProjectDetailsModel));

  @override
  _ProjectDetailsModel get _value => super._value as _ProjectDetailsModel;

  @override
  $Res call({
    Object projectArea = freezed,
    Object plinthArea = freezed,
    Object projectEstimate = freezed,
    Object projectTotalPaid = freezed,
    Object projectStartDate = freezed,
    Object projectDateOfCompletion = freezed,
    Object projectEstDateOfCompletion = freezed,
    Object percentageOfCompletion = freezed,
    Object projectEngineer = freezed,
    Object contractor = freezed,
    Object projectAddress = freezed,
  }) {
    return _then(_ProjectDetailsModel(
      projectArea:
          projectArea == freezed ? _value.projectArea : projectArea as String,
      plinthArea:
          plinthArea == freezed ? _value.plinthArea : plinthArea as String,
      projectEstimate: projectEstimate == freezed
          ? _value.projectEstimate
          : projectEstimate as String,
      projectTotalPaid: projectTotalPaid == freezed
          ? _value.projectTotalPaid
          : projectTotalPaid as String,
      projectStartDate: projectStartDate == freezed
          ? _value.projectStartDate
          : projectStartDate as String,
      projectDateOfCompletion: projectDateOfCompletion == freezed
          ? _value.projectDateOfCompletion
          : projectDateOfCompletion as String,
      projectEstDateOfCompletion: projectEstDateOfCompletion == freezed
          ? _value.projectEstDateOfCompletion
          : projectEstDateOfCompletion as String,
      percentageOfCompletion: percentageOfCompletion == freezed
          ? _value.percentageOfCompletion
          : percentageOfCompletion as String,
      projectEngineer: projectEngineer == freezed
          ? _value.projectEngineer
          : projectEngineer as EngineerModel,
      contractor: contractor == freezed
          ? _value.contractor
          : contractor as ContractorModel,
      projectAddress: projectAddress == freezed
          ? _value.projectAddress
          : projectAddress as Address,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_ProjectDetailsModel implements _ProjectDetailsModel {
  _$_ProjectDetailsModel(
      {@JsonKey(name: JsonConstants.project_area)
          this.projectArea,
      @JsonKey(name: JsonConstants.plinth_area)
          this.plinthArea,
      @JsonKey(name: JsonConstants.projectEstimate)
          this.projectEstimate,
      @JsonKey(name: JsonConstants.projectTotalPaid)
          this.projectTotalPaid,
      @JsonKey(name: JsonConstants.projectStartDate)
          this.projectStartDate,
      @JsonKey(name: JsonConstants.projectDateOfCompletion)
          this.projectDateOfCompletion,
      this.projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          this.percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          this.projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          this.contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          this.projectAddress});

  factory _$_ProjectDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ProjectDetailsModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.project_area)
  final String projectArea;
  @override
  @JsonKey(name: JsonConstants.plinth_area)
  final String plinthArea;
  @override
  @JsonKey(name: JsonConstants.projectEstimate)
  final String projectEstimate;
  @override
  @JsonKey(name: JsonConstants.projectTotalPaid)
  final String projectTotalPaid;
  @override
  @JsonKey(name: JsonConstants.projectStartDate)
  final String projectStartDate;
  @override
  @JsonKey(name: JsonConstants.projectDateOfCompletion)
  final String projectDateOfCompletion;
  @override
  final String projectEstDateOfCompletion;
  @override
  @JsonKey(name: JsonConstants.projectCompletionPercentage)
  final String percentageOfCompletion;
  @override
  @JsonKey(name: JsonConstants.projectEngineer)
  final EngineerModel projectEngineer;
  @override
  @JsonKey(name: JsonConstants.contractor)
  final ContractorModel contractor;
  @override
  @JsonKey(name: JsonConstants.projectAddress)
  final Address projectAddress;

  @override
  String toString() {
    return 'ProjectDetailsModel(projectArea: $projectArea, plinthArea: $plinthArea, projectEstimate: $projectEstimate, projectTotalPaid: $projectTotalPaid, projectStartDate: $projectStartDate, projectDateOfCompletion: $projectDateOfCompletion, projectEstDateOfCompletion: $projectEstDateOfCompletion, percentageOfCompletion: $percentageOfCompletion, projectEngineer: $projectEngineer, contractor: $contractor, projectAddress: $projectAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProjectDetailsModel &&
            (identical(other.projectArea, projectArea) ||
                const DeepCollectionEquality()
                    .equals(other.projectArea, projectArea)) &&
            (identical(other.plinthArea, plinthArea) ||
                const DeepCollectionEquality()
                    .equals(other.plinthArea, plinthArea)) &&
            (identical(other.projectEstimate, projectEstimate) ||
                const DeepCollectionEquality()
                    .equals(other.projectEstimate, projectEstimate)) &&
            (identical(other.projectTotalPaid, projectTotalPaid) ||
                const DeepCollectionEquality()
                    .equals(other.projectTotalPaid, projectTotalPaid)) &&
            (identical(other.projectStartDate, projectStartDate) ||
                const DeepCollectionEquality()
                    .equals(other.projectStartDate, projectStartDate)) &&
            (identical(
                    other.projectDateOfCompletion, projectDateOfCompletion) ||
                const DeepCollectionEquality().equals(
                    other.projectDateOfCompletion, projectDateOfCompletion)) &&
            (identical(other.projectEstDateOfCompletion,
                    projectEstDateOfCompletion) ||
                const DeepCollectionEquality().equals(
                    other.projectEstDateOfCompletion,
                    projectEstDateOfCompletion)) &&
            (identical(other.percentageOfCompletion, percentageOfCompletion) ||
                const DeepCollectionEquality().equals(
                    other.percentageOfCompletion, percentageOfCompletion)) &&
            (identical(other.projectEngineer, projectEngineer) ||
                const DeepCollectionEquality()
                    .equals(other.projectEngineer, projectEngineer)) &&
            (identical(other.contractor, contractor) ||
                const DeepCollectionEquality()
                    .equals(other.contractor, contractor)) &&
            (identical(other.projectAddress, projectAddress) ||
                const DeepCollectionEquality()
                    .equals(other.projectAddress, projectAddress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(projectArea) ^
      const DeepCollectionEquality().hash(plinthArea) ^
      const DeepCollectionEquality().hash(projectEstimate) ^
      const DeepCollectionEquality().hash(projectTotalPaid) ^
      const DeepCollectionEquality().hash(projectStartDate) ^
      const DeepCollectionEquality().hash(projectDateOfCompletion) ^
      const DeepCollectionEquality().hash(projectEstDateOfCompletion) ^
      const DeepCollectionEquality().hash(percentageOfCompletion) ^
      const DeepCollectionEquality().hash(projectEngineer) ^
      const DeepCollectionEquality().hash(contractor) ^
      const DeepCollectionEquality().hash(projectAddress);

  @override
  _$ProjectDetailsModelCopyWith<_ProjectDetailsModel> get copyWith =>
      __$ProjectDetailsModelCopyWithImpl<_ProjectDetailsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProjectDetailsModelToJson(this);
  }
}

abstract class _ProjectDetailsModel implements ProjectDetailsModel {
  factory _ProjectDetailsModel(
      {@JsonKey(name: JsonConstants.project_area)
          String projectArea,
      @JsonKey(name: JsonConstants.plinth_area)
          String plinthArea,
      @JsonKey(name: JsonConstants.projectEstimate)
          String projectEstimate,
      @JsonKey(name: JsonConstants.projectTotalPaid)
          String projectTotalPaid,
      @JsonKey(name: JsonConstants.projectStartDate)
          String projectStartDate,
      @JsonKey(name: JsonConstants.projectDateOfCompletion)
          String projectDateOfCompletion,
      String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress}) = _$_ProjectDetailsModel;

  factory _ProjectDetailsModel.fromJson(Map<String, dynamic> json) =
      _$_ProjectDetailsModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.project_area)
  String get projectArea;
  @override
  @JsonKey(name: JsonConstants.plinth_area)
  String get plinthArea;
  @override
  @JsonKey(name: JsonConstants.projectEstimate)
  String get projectEstimate;
  @override
  @JsonKey(name: JsonConstants.projectTotalPaid)
  String get projectTotalPaid;
  @override
  @JsonKey(name: JsonConstants.projectStartDate)
  String get projectStartDate;
  @override
  @JsonKey(name: JsonConstants.projectDateOfCompletion)
  String get projectDateOfCompletion;
  @override
  String get projectEstDateOfCompletion;
  @override
  @JsonKey(name: JsonConstants.projectCompletionPercentage)
  String get percentageOfCompletion;
  @override
  @JsonKey(name: JsonConstants.projectEngineer)
  EngineerModel get projectEngineer;
  @override
  @JsonKey(name: JsonConstants.contractor)
  ContractorModel get contractor;
  @override
  @JsonKey(name: JsonConstants.projectAddress)
  Address get projectAddress;
  @override
  _$ProjectDetailsModelCopyWith<_ProjectDetailsModel> get copyWith;
}
