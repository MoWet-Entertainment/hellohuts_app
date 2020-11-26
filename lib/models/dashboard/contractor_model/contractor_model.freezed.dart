// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'contractor_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ContractorModel _$ContractorModelFromJson(Map<String, dynamic> json) {
  return _ContractorModel.fromJson(json);
}

/// @nodoc
class _$ContractorModelTearOff {
  const _$ContractorModelTearOff();

// ignore: unused_element
  _ContractorModel call(
      {@JsonKey(name: JsonConstants.contractorName)
          String contractorName,
      @JsonKey(name: JsonConstants.address)
          Address contractorAddress,
      @JsonKey(name: JsonConstants.contractorCompany)
          CompanyModel contractorCompany}) {
    return _ContractorModel(
      contractorName: contractorName,
      contractorAddress: contractorAddress,
      contractorCompany: contractorCompany,
    );
  }

// ignore: unused_element
  ContractorModel fromJson(Map<String, Object> json) {
    return ContractorModel.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ContractorModel = _$ContractorModelTearOff();

/// @nodoc
mixin _$ContractorModel {
  @JsonKey(name: JsonConstants.contractorName)
  String get contractorName;
  @JsonKey(name: JsonConstants.address)
  Address get contractorAddress;
  @JsonKey(name: JsonConstants.contractorCompany)
  CompanyModel get contractorCompany;

  Map<String, dynamic> toJson();
  $ContractorModelCopyWith<ContractorModel> get copyWith;
}

/// @nodoc
abstract class $ContractorModelCopyWith<$Res> {
  factory $ContractorModelCopyWith(
          ContractorModel value, $Res Function(ContractorModel) then) =
      _$ContractorModelCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.contractorName)
          String contractorName,
      @JsonKey(name: JsonConstants.address)
          Address contractorAddress,
      @JsonKey(name: JsonConstants.contractorCompany)
          CompanyModel contractorCompany});

  $AddressCopyWith<$Res> get contractorAddress;
  $CompanyModelCopyWith<$Res> get contractorCompany;
}

/// @nodoc
class _$ContractorModelCopyWithImpl<$Res>
    implements $ContractorModelCopyWith<$Res> {
  _$ContractorModelCopyWithImpl(this._value, this._then);

  final ContractorModel _value;
  // ignore: unused_field
  final $Res Function(ContractorModel) _then;

  @override
  $Res call({
    Object contractorName = freezed,
    Object contractorAddress = freezed,
    Object contractorCompany = freezed,
  }) {
    return _then(_value.copyWith(
      contractorName: contractorName == freezed
          ? _value.contractorName
          : contractorName as String,
      contractorAddress: contractorAddress == freezed
          ? _value.contractorAddress
          : contractorAddress as Address,
      contractorCompany: contractorCompany == freezed
          ? _value.contractorCompany
          : contractorCompany as CompanyModel,
    ));
  }

  @override
  $AddressCopyWith<$Res> get contractorAddress {
    if (_value.contractorAddress == null) {
      return null;
    }
    return $AddressCopyWith<$Res>(_value.contractorAddress, (value) {
      return _then(_value.copyWith(contractorAddress: value));
    });
  }

  @override
  $CompanyModelCopyWith<$Res> get contractorCompany {
    if (_value.contractorCompany == null) {
      return null;
    }
    return $CompanyModelCopyWith<$Res>(_value.contractorCompany, (value) {
      return _then(_value.copyWith(contractorCompany: value));
    });
  }
}

/// @nodoc
abstract class _$ContractorModelCopyWith<$Res>
    implements $ContractorModelCopyWith<$Res> {
  factory _$ContractorModelCopyWith(
          _ContractorModel value, $Res Function(_ContractorModel) then) =
      __$ContractorModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.contractorName)
          String contractorName,
      @JsonKey(name: JsonConstants.address)
          Address contractorAddress,
      @JsonKey(name: JsonConstants.contractorCompany)
          CompanyModel contractorCompany});

  @override
  $AddressCopyWith<$Res> get contractorAddress;
  @override
  $CompanyModelCopyWith<$Res> get contractorCompany;
}

/// @nodoc
class __$ContractorModelCopyWithImpl<$Res>
    extends _$ContractorModelCopyWithImpl<$Res>
    implements _$ContractorModelCopyWith<$Res> {
  __$ContractorModelCopyWithImpl(
      _ContractorModel _value, $Res Function(_ContractorModel) _then)
      : super(_value, (v) => _then(v as _ContractorModel));

  @override
  _ContractorModel get _value => super._value as _ContractorModel;

  @override
  $Res call({
    Object contractorName = freezed,
    Object contractorAddress = freezed,
    Object contractorCompany = freezed,
  }) {
    return _then(_ContractorModel(
      contractorName: contractorName == freezed
          ? _value.contractorName
          : contractorName as String,
      contractorAddress: contractorAddress == freezed
          ? _value.contractorAddress
          : contractorAddress as Address,
      contractorCompany: contractorCompany == freezed
          ? _value.contractorCompany
          : contractorCompany as CompanyModel,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_ContractorModel implements _ContractorModel {
  _$_ContractorModel(
      {@JsonKey(name: JsonConstants.contractorName) this.contractorName,
      @JsonKey(name: JsonConstants.address) this.contractorAddress,
      @JsonKey(name: JsonConstants.contractorCompany) this.contractorCompany});

  factory _$_ContractorModel.fromJson(Map<String, dynamic> json) =>
      _$_$_ContractorModelFromJson(json);

  @override
  @JsonKey(name: JsonConstants.contractorName)
  final String contractorName;
  @override
  @JsonKey(name: JsonConstants.address)
  final Address contractorAddress;
  @override
  @JsonKey(name: JsonConstants.contractorCompany)
  final CompanyModel contractorCompany;

  @override
  String toString() {
    return 'ContractorModel(contractorName: $contractorName, contractorAddress: $contractorAddress, contractorCompany: $contractorCompany)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ContractorModel &&
            (identical(other.contractorName, contractorName) ||
                const DeepCollectionEquality()
                    .equals(other.contractorName, contractorName)) &&
            (identical(other.contractorAddress, contractorAddress) ||
                const DeepCollectionEquality()
                    .equals(other.contractorAddress, contractorAddress)) &&
            (identical(other.contractorCompany, contractorCompany) ||
                const DeepCollectionEquality()
                    .equals(other.contractorCompany, contractorCompany)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(contractorName) ^
      const DeepCollectionEquality().hash(contractorAddress) ^
      const DeepCollectionEquality().hash(contractorCompany);

  @override
  _$ContractorModelCopyWith<_ContractorModel> get copyWith =>
      __$ContractorModelCopyWithImpl<_ContractorModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ContractorModelToJson(this);
  }
}

abstract class _ContractorModel implements ContractorModel {
  factory _ContractorModel(
      {@JsonKey(name: JsonConstants.contractorName)
          String contractorName,
      @JsonKey(name: JsonConstants.address)
          Address contractorAddress,
      @JsonKey(name: JsonConstants.contractorCompany)
          CompanyModel contractorCompany}) = _$_ContractorModel;

  factory _ContractorModel.fromJson(Map<String, dynamic> json) =
      _$_ContractorModel.fromJson;

  @override
  @JsonKey(name: JsonConstants.contractorName)
  String get contractorName;
  @override
  @JsonKey(name: JsonConstants.address)
  Address get contractorAddress;
  @override
  @JsonKey(name: JsonConstants.contractorCompany)
  CompanyModel get contractorCompany;
  @override
  _$ContractorModelCopyWith<_ContractorModel> get copyWith;
}
