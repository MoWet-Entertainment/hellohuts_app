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
      @JsonKey(name: JsonConstants.baseRate)
          String baseRate,
      @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
          String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress,
      @JsonKey(name: JsonConstants.selectedPlan)
          SelectedPlanModel selectedPlan,
      @JsonKey(name: JsonConstants.buildingRequirements)
          BuildingRequirementsModel buildingRequirements,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) {
    return _ProjectDetailsModel(
      projectArea: projectArea,
      plinthArea: plinthArea,
      projectEstimate: projectEstimate,
      projectTotalPaid: projectTotalPaid,
      projectStartDate: projectStartDate,
      projectDateOfCompletion: projectDateOfCompletion,
      baseRate: baseRate,
      projectEstDateOfCompletion: projectEstDateOfCompletion,
      percentageOfCompletion: percentageOfCompletion,
      projectEngineer: projectEngineer,
      contractor: contractor,
      projectAddress: projectAddress,
      selectedPlan: selectedPlan,
      buildingRequirements: buildingRequirements,
      createdTimeStamp: createdTimeStamp,
      updatedTimeStamp: updatedTimeStamp,
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
  @JsonKey(name: JsonConstants.baseRate)
  String get baseRate;
  @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
  String get projectEstDateOfCompletion;
  @JsonKey(name: JsonConstants.projectCompletionPercentage)
  String get percentageOfCompletion;
  @JsonKey(name: JsonConstants.projectEngineer)
  EngineerModel get projectEngineer;
  @JsonKey(name: JsonConstants.contractor)
  ContractorModel get contractor;
  @JsonKey(name: JsonConstants.projectAddress)
  Address get projectAddress;
  @JsonKey(name: JsonConstants.selectedPlan)
  SelectedPlanModel get selectedPlan;
  @JsonKey(name: JsonConstants.buildingRequirements)
  BuildingRequirementsModel get buildingRequirements;
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
      @JsonKey(name: JsonConstants.baseRate)
          String baseRate,
      @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
          String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress,
      @JsonKey(name: JsonConstants.selectedPlan)
          SelectedPlanModel selectedPlan,
      @JsonKey(name: JsonConstants.buildingRequirements)
          BuildingRequirementsModel buildingRequirements,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});

  $EngineerModelCopyWith<$Res> get projectEngineer;
  $ContractorModelCopyWith<$Res> get contractor;
  $AddressCopyWith<$Res> get projectAddress;
  $SelectedPlanModelCopyWith<$Res> get selectedPlan;
  $BuildingRequirementsModelCopyWith<$Res> get buildingRequirements;
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
    Object baseRate = freezed,
    Object projectEstDateOfCompletion = freezed,
    Object percentageOfCompletion = freezed,
    Object projectEngineer = freezed,
    Object contractor = freezed,
    Object projectAddress = freezed,
    Object selectedPlan = freezed,
    Object buildingRequirements = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
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
      baseRate: baseRate == freezed ? _value.baseRate : baseRate as String,
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
      selectedPlan: selectedPlan == freezed
          ? _value.selectedPlan
          : selectedPlan as SelectedPlanModel,
      buildingRequirements: buildingRequirements == freezed
          ? _value.buildingRequirements
          : buildingRequirements as BuildingRequirementsModel,
      createdTimeStamp: createdTimeStamp == freezed
          ? _value.createdTimeStamp
          : createdTimeStamp as DateTime,
      updatedTimeStamp: updatedTimeStamp == freezed
          ? _value.updatedTimeStamp
          : updatedTimeStamp as DateTime,
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

  @override
  $SelectedPlanModelCopyWith<$Res> get selectedPlan {
    if (_value.selectedPlan == null) {
      return null;
    }
    return $SelectedPlanModelCopyWith<$Res>(_value.selectedPlan, (value) {
      return _then(_value.copyWith(selectedPlan: value));
    });
  }

  @override
  $BuildingRequirementsModelCopyWith<$Res> get buildingRequirements {
    if (_value.buildingRequirements == null) {
      return null;
    }
    return $BuildingRequirementsModelCopyWith<$Res>(_value.buildingRequirements,
        (value) {
      return _then(_value.copyWith(buildingRequirements: value));
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
      @JsonKey(name: JsonConstants.baseRate)
          String baseRate,
      @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
          String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress,
      @JsonKey(name: JsonConstants.selectedPlan)
          SelectedPlanModel selectedPlan,
      @JsonKey(name: JsonConstants.buildingRequirements)
          BuildingRequirementsModel buildingRequirements,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp});

  @override
  $EngineerModelCopyWith<$Res> get projectEngineer;
  @override
  $ContractorModelCopyWith<$Res> get contractor;
  @override
  $AddressCopyWith<$Res> get projectAddress;
  @override
  $SelectedPlanModelCopyWith<$Res> get selectedPlan;
  @override
  $BuildingRequirementsModelCopyWith<$Res> get buildingRequirements;
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
    Object baseRate = freezed,
    Object projectEstDateOfCompletion = freezed,
    Object percentageOfCompletion = freezed,
    Object projectEngineer = freezed,
    Object contractor = freezed,
    Object projectAddress = freezed,
    Object selectedPlan = freezed,
    Object buildingRequirements = freezed,
    Object createdTimeStamp = freezed,
    Object updatedTimeStamp = freezed,
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
      baseRate: baseRate == freezed ? _value.baseRate : baseRate as String,
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
      selectedPlan: selectedPlan == freezed
          ? _value.selectedPlan
          : selectedPlan as SelectedPlanModel,
      buildingRequirements: buildingRequirements == freezed
          ? _value.buildingRequirements
          : buildingRequirements as BuildingRequirementsModel,
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
      @JsonKey(name: JsonConstants.baseRate)
          this.baseRate,
      @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
          this.projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          this.percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          this.projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          this.contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          this.projectAddress,
      @JsonKey(name: JsonConstants.selectedPlan)
          this.selectedPlan,
      @JsonKey(name: JsonConstants.buildingRequirements)
          this.buildingRequirements,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          this.updatedTimeStamp});

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
  @JsonKey(name: JsonConstants.baseRate)
  final String baseRate;
  @override
  @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
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
  @JsonKey(name: JsonConstants.selectedPlan)
  final SelectedPlanModel selectedPlan;
  @override
  @JsonKey(name: JsonConstants.buildingRequirements)
  final BuildingRequirementsModel buildingRequirements;
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
    return 'ProjectDetailsModel(projectArea: $projectArea, plinthArea: $plinthArea, projectEstimate: $projectEstimate, projectTotalPaid: $projectTotalPaid, projectStartDate: $projectStartDate, projectDateOfCompletion: $projectDateOfCompletion, baseRate: $baseRate, projectEstDateOfCompletion: $projectEstDateOfCompletion, percentageOfCompletion: $percentageOfCompletion, projectEngineer: $projectEngineer, contractor: $contractor, projectAddress: $projectAddress, selectedPlan: $selectedPlan, buildingRequirements: $buildingRequirements, createdTimeStamp: $createdTimeStamp, updatedTimeStamp: $updatedTimeStamp)';
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
            (identical(other.projectDateOfCompletion, projectDateOfCompletion) ||
                const DeepCollectionEquality().equals(
                    other.projectDateOfCompletion, projectDateOfCompletion)) &&
            (identical(other.baseRate, baseRate) ||
                const DeepCollectionEquality()
                    .equals(other.baseRate, baseRate)) &&
            (identical(other.projectEstDateOfCompletion, projectEstDateOfCompletion) ||
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
                    .equals(other.projectAddress, projectAddress)) &&
            (identical(other.selectedPlan, selectedPlan) ||
                const DeepCollectionEquality()
                    .equals(other.selectedPlan, selectedPlan)) &&
            (identical(other.buildingRequirements, buildingRequirements) ||
                const DeepCollectionEquality().equals(
                    other.buildingRequirements, buildingRequirements)) &&
            (identical(other.createdTimeStamp, createdTimeStamp) ||
                const DeepCollectionEquality().equals(other.createdTimeStamp, createdTimeStamp)) &&
            (identical(other.updatedTimeStamp, updatedTimeStamp) || const DeepCollectionEquality().equals(other.updatedTimeStamp, updatedTimeStamp)));
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
      const DeepCollectionEquality().hash(baseRate) ^
      const DeepCollectionEquality().hash(projectEstDateOfCompletion) ^
      const DeepCollectionEquality().hash(percentageOfCompletion) ^
      const DeepCollectionEquality().hash(projectEngineer) ^
      const DeepCollectionEquality().hash(contractor) ^
      const DeepCollectionEquality().hash(projectAddress) ^
      const DeepCollectionEquality().hash(selectedPlan) ^
      const DeepCollectionEquality().hash(buildingRequirements) ^
      const DeepCollectionEquality().hash(createdTimeStamp) ^
      const DeepCollectionEquality().hash(updatedTimeStamp);

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
      @JsonKey(name: JsonConstants.baseRate)
          String baseRate,
      @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
          String projectEstDateOfCompletion,
      @JsonKey(name: JsonConstants.projectCompletionPercentage)
          String percentageOfCompletion,
      @JsonKey(name: JsonConstants.projectEngineer)
          EngineerModel projectEngineer,
      @JsonKey(name: JsonConstants.contractor)
          ContractorModel contractor,
      @JsonKey(name: JsonConstants.projectAddress)
          Address projectAddress,
      @JsonKey(name: JsonConstants.selectedPlan)
          SelectedPlanModel selectedPlan,
      @JsonKey(name: JsonConstants.buildingRequirements)
          BuildingRequirementsModel buildingRequirements,
      @JsonKey(name: JsonConstants.createdAt, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime createdTimeStamp,
      @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
          DateTime updatedTimeStamp}) = _$_ProjectDetailsModel;

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
  @JsonKey(name: JsonConstants.baseRate)
  String get baseRate;
  @override
  @JsonKey(name: JsonConstants.projectEstimatedDateOfCompletion)
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
  @JsonKey(name: JsonConstants.selectedPlan)
  SelectedPlanModel get selectedPlan;
  @override
  @JsonKey(name: JsonConstants.buildingRequirements)
  BuildingRequirementsModel get buildingRequirements;
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
  _$ProjectDetailsModelCopyWith<_ProjectDetailsModel> get copyWith;
}
