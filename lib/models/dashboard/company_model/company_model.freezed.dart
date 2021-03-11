// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'company_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) {
  return _CompanyModel.fromJson(json);
}

/// @nodoc
class _$CompanyModelTearOff {
  const _$CompanyModelTearOff();

// ignore: unused_element
  _CompanyModel call(
      {@JsonKey(name: JsonConstants.address) Address companyAddress,
      @JsonKey(name: JsonConstants.companyName) String companyName,
      @JsonKey(name: JsonConstants.uniqueId) String companyId}) {
    return _CompanyModel(
      companyAddress: companyAddress,
      companyName: companyName,
      companyId: companyId,
    );
  }

// ignore: unused_element
  CompanyModel fromJson(Map<String, Object> json) {
    return CompanyModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $CompanyModel = _$CompanyModelTearOff();

/// @nodoc
mixin _$CompanyModel {
  @JsonKey(name: JsonConstants.address)
  Address get companyAddress;
  @JsonKey(name: JsonConstants.companyName)
  String get companyName;
  @JsonKey(name: JsonConstants.uniqueId)
  String get companyId;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $CompanyModelCopyWith<CompanyModel> get copyWith;
}

/// @nodoc
abstract class $CompanyModelCopyWith<$Res> {
  factory $CompanyModelCopyWith(
          CompanyModel value, $Res Function(CompanyModel) then) =
      _$CompanyModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.address) Address companyAddress,
      @JsonKey(name: JsonConstants.companyName) String companyName,
      @JsonKey(name: JsonConstants.uniqueId) String companyId});

  $AddressCopyWith<$Res> get companyAddress;
}

/// @nodoc
class _$CompanyModelCopyWithImpl<$Res> implements $CompanyModelCopyWith<$Res> {
  _$CompanyModelCopyWithImpl(this._value, this._then);

  final CompanyModel _value;
  // ignore: unused_field
  final $Res Function(CompanyModel) _then;

  @override
  $Res call({
    Object companyAddress = freezed,
    Object companyName = freezed,
    Object companyId = freezed,
  }) {
    return _then(_value.copyWith(
      companyAddress: companyAddress == freezed
          ? _value.companyAddress
          : companyAddress as Address,
      companyName:
          companyName == freezed ? _value.companyName : companyName as String,
      companyId: companyId == freezed ? _value.companyId : companyId as String,
    ));
  }

  @override
  $AddressCopyWith<$Res> get companyAddress {
    if (_value.companyAddress == null) {
      return null;
    }
    return $AddressCopyWith<$Res>(_value.companyAddress, (value) {
      return _then(_value.copyWith(companyAddress: value));
    });
  }
}

/// @nodoc
abstract class _$CompanyModelCopyWith<$Res>
    implements $CompanyModelCopyWith<$Res> {
  factory _$CompanyModelCopyWith(
          _CompanyModel value, $Res Function(_CompanyModel) then) =
      __$CompanyModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.address) Address companyAddress,
      @JsonKey(name: JsonConstants.companyName) String companyName,
      @JsonKey(name: JsonConstants.uniqueId) String companyId});

  @override
  $AddressCopyWith<$Res> get companyAddress;
}

/// @nodoc
class __$CompanyModelCopyWithImpl<$Res> extends _$CompanyModelCopyWithImpl<$Res>
    implements _$CompanyModelCopyWith<$Res> {
  __$CompanyModelCopyWithImpl(
      _CompanyModel _value, $Res Function(_CompanyModel) _then)
      : super(_value, (v) => _then(v as _CompanyModel));

  @override
  _CompanyModel get _value => super._value as _CompanyModel;

  @override
  $Res call({
    Object companyAddress = freezed,
    Object companyName = freezed,
    Object companyId = freezed,
  }) {
    return _then(_CompanyModel(
      companyAddress: companyAddress == freezed
          ? _value.companyAddress
          : companyAddress as Address,
      companyName:
          companyName == freezed ? _value.companyName : companyName as String,
      companyId: companyId == freezed ? _value.companyId : companyId as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_CompanyModel implements _CompanyModel {
  _$_CompanyModel(
      {@JsonKey(name: JsonConstants.address) this.companyAddress,
      @JsonKey(name: JsonConstants.companyName) this.companyName,
      @JsonKey(name: JsonConstants.uniqueId) this.companyId});

  factory _$_CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$_$_CompanyModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.address)
  final Address companyAddress;
  @override
  @JsonKey(name: JsonConstants.companyName)
  final String companyName;
  @override
  @JsonKey(name: JsonConstants.uniqueId)
  final String companyId;

  @override
  String toString() {
    return 'CompanyModel(companyAddress: $companyAddress, companyName: $companyName, companyId: $companyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CompanyModel &&
            (identical(other.companyAddress, companyAddress) ||
                const DeepCollectionEquality()
                    .equals(other.companyAddress, companyAddress)) &&
            (identical(other.companyName, companyName) ||
                const DeepCollectionEquality()
                    .equals(other.companyName, companyName)) &&
            (identical(other.companyId, companyId) ||
                const DeepCollectionEquality()
                    .equals(other.companyId, companyId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(companyAddress) ^
      const DeepCollectionEquality().hash(companyName) ^
      const DeepCollectionEquality().hash(companyId);

  @JsonKey(ignore: true)
  @override
  _$CompanyModelCopyWith<_CompanyModel> get copyWith =>
      __$CompanyModelCopyWithImpl<_CompanyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CompanyModelToJson(this);
  }
}

abstract class _CompanyModel implements CompanyModel {
  factory _CompanyModel(
          {@JsonKey(name: JsonConstants.address) Address companyAddress,
          @JsonKey(name: JsonConstants.companyName) String companyName,
          @JsonKey(name: JsonConstants.uniqueId) String companyId}) =
      _$_CompanyModel;

  factory _CompanyModel.fromJson(Map<String, dynamic> json) =
      _$_CompanyModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.address)
  Address get companyAddress;
  @override
  @JsonKey(name: JsonConstants.companyName)
  String get companyName;
  @override
  @JsonKey(name: JsonConstants.uniqueId)
  String get companyId;
  @override
  @JsonKey(ignore: true)
  _$CompanyModelCopyWith<_CompanyModel> get copyWith;
}
