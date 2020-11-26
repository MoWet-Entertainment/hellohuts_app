// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'engineer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
EngineerModel _$EngineerModelFromJson(Map<String, dynamic> json) {
  return _EngineerModel.fromJson(json);
}

/// @nodoc
class _$EngineerModelTearOff {
  const _$EngineerModelTearOff();

// ignore: unused_element
  _EngineerModel call(
      {@JsonKey(name: JsonConstants.engineerDetails) AppUser engineer,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userCompany) String userCompany}) {
    return _EngineerModel(
      engineer: engineer,
      userRole: userRole,
      userCompany: userCompany,
    );
  }

// ignore: unused_element
  EngineerModel fromJson(Map<String, Object> json) {
    return EngineerModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $EngineerModel = _$EngineerModelTearOff();

/// @nodoc
mixin _$EngineerModel {
  @JsonKey(name: JsonConstants.engineerDetails)
  AppUser get engineer;
  @JsonKey(name: JsonConstants.userRole)
  String get userRole;
  @JsonKey(name: JsonConstants.userCompany)
  String get userCompany;

  Map<String, dynamic> toJson();
  $EngineerModelCopyWith<EngineerModel> get copyWith;
}

/// @nodoc
abstract class $EngineerModelCopyWith<$Res> {
  factory $EngineerModelCopyWith(
          EngineerModel value, $Res Function(EngineerModel) then) =
      _$EngineerModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.engineerDetails) AppUser engineer,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userCompany) String userCompany});

  $AppUserCopyWith<$Res> get engineer;
}

/// @nodoc
class _$EngineerModelCopyWithImpl<$Res>
    implements $EngineerModelCopyWith<$Res> {
  _$EngineerModelCopyWithImpl(this._value, this._then);

  final EngineerModel _value;
  // ignore: unused_field
  final $Res Function(EngineerModel) _then;

  @override
  $Res call({
    Object engineer = freezed,
    Object userRole = freezed,
    Object userCompany = freezed,
  }) {
    return _then(_value.copyWith(
      engineer: engineer == freezed ? _value.engineer : engineer as AppUser,
      userRole: userRole == freezed ? _value.userRole : userRole as String,
      userCompany:
          userCompany == freezed ? _value.userCompany : userCompany as String,
    ));
  }

  @override
  $AppUserCopyWith<$Res> get engineer {
    if (_value.engineer == null) {
      return null;
    }
    return $AppUserCopyWith<$Res>(_value.engineer, (value) {
      return _then(_value.copyWith(engineer: value));
    });
  }
}

/// @nodoc
abstract class _$EngineerModelCopyWith<$Res>
    implements $EngineerModelCopyWith<$Res> {
  factory _$EngineerModelCopyWith(
          _EngineerModel value, $Res Function(_EngineerModel) then) =
      __$EngineerModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.engineerDetails) AppUser engineer,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userCompany) String userCompany});

  @override
  $AppUserCopyWith<$Res> get engineer;
}

/// @nodoc
class __$EngineerModelCopyWithImpl<$Res>
    extends _$EngineerModelCopyWithImpl<$Res>
    implements _$EngineerModelCopyWith<$Res> {
  __$EngineerModelCopyWithImpl(
      _EngineerModel _value, $Res Function(_EngineerModel) _then)
      : super(_value, (v) => _then(v as _EngineerModel));

  @override
  _EngineerModel get _value => super._value as _EngineerModel;

  @override
  $Res call({
    Object engineer = freezed,
    Object userRole = freezed,
    Object userCompany = freezed,
  }) {
    return _then(_EngineerModel(
      engineer: engineer == freezed ? _value.engineer : engineer as AppUser,
      userRole: userRole == freezed ? _value.userRole : userRole as String,
      userCompany:
          userCompany == freezed ? _value.userCompany : userCompany as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_EngineerModel implements _EngineerModel {
  _$_EngineerModel(
      {@JsonKey(name: JsonConstants.engineerDetails) this.engineer,
      @JsonKey(name: JsonConstants.userRole) this.userRole,
      @JsonKey(name: JsonConstants.userCompany) this.userCompany});

  factory _$_EngineerModel.fromJson(Map<String, dynamic> json) =>
      _$_$_EngineerModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.engineerDetails)
  final AppUser engineer;
  @override
  @JsonKey(name: JsonConstants.userRole)
  final String userRole;
  @override
  @JsonKey(name: JsonConstants.userCompany)
  final String userCompany;

  @override
  String toString() {
    return 'EngineerModel(engineer: $engineer, userRole: $userRole, userCompany: $userCompany)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EngineerModel &&
            (identical(other.engineer, engineer) ||
                const DeepCollectionEquality()
                    .equals(other.engineer, engineer)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)) &&
            (identical(other.userCompany, userCompany) ||
                const DeepCollectionEquality()
                    .equals(other.userCompany, userCompany)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(engineer) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(userCompany);

  @override
  _$EngineerModelCopyWith<_EngineerModel> get copyWith =>
      __$EngineerModelCopyWithImpl<_EngineerModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EngineerModelToJson(this);
  }
}

abstract class _EngineerModel implements EngineerModel {
  factory _EngineerModel(
          {@JsonKey(name: JsonConstants.engineerDetails) AppUser engineer,
          @JsonKey(name: JsonConstants.userRole) String userRole,
          @JsonKey(name: JsonConstants.userCompany) String userCompany}) =
      _$_EngineerModel;

  factory _EngineerModel.fromJson(Map<String, dynamic> json) =
      _$_EngineerModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.engineerDetails)
  AppUser get engineer;
  @override
  @JsonKey(name: JsonConstants.userRole)
  String get userRole;
  @override
  @JsonKey(name: JsonConstants.userCompany)
  String get userCompany;
  @override
  _$EngineerModelCopyWith<_EngineerModel> get copyWith;
}
