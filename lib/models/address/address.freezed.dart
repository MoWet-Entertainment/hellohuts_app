// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
class _$AddressTearOff {
  const _$AddressTearOff();

// ignore: unused_element
  _Address call(
      {@JsonKey(name: JsonConstants.address1) String address1,
      @JsonKey(name: JsonConstants.address2) String address2,
      @JsonKey(name: JsonConstants.postalLoc) String postalLoc,
      @JsonKey(name: JsonConstants.postalCode) String postalCode,
      @JsonKey(name: JsonConstants.district) String district,
      @JsonKey(name: JsonConstants.state) String state,
      @JsonKey(name: JsonConstants.country) String country}) {
    return _Address(
      address1: address1,
      address2: address2,
      postalLoc: postalLoc,
      postalCode: postalCode,
      district: district,
      state: state,
      country: country,
    );
  }

// ignore: unused_element
  Address fromJson(Map<String, Object> json) {
    return Address.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Address = _$AddressTearOff();

/// @nodoc
mixin _$Address {
  @JsonKey(name: JsonConstants.address1)
  String get address1;
  @JsonKey(name: JsonConstants.address2)
  String get address2;
  @JsonKey(name: JsonConstants.postalLoc)
  String get postalLoc;
  @JsonKey(name: JsonConstants.postalCode)
  String get postalCode;
  @JsonKey(name: JsonConstants.district)
  String get district;
  @JsonKey(name: JsonConstants.state)
  String get state;
  @JsonKey(name: JsonConstants.country)
  String get country;

  Map<String, dynamic> toJson();
  $AddressCopyWith<Address> get copyWith;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.address1) String address1,
      @JsonKey(name: JsonConstants.address2) String address2,
      @JsonKey(name: JsonConstants.postalLoc) String postalLoc,
      @JsonKey(name: JsonConstants.postalCode) String postalCode,
      @JsonKey(name: JsonConstants.district) String district,
      @JsonKey(name: JsonConstants.state) String state,
      @JsonKey(name: JsonConstants.country) String country});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res> implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  final Address _value;
  // ignore: unused_field
  final $Res Function(Address) _then;

  @override
  $Res call({
    Object address1 = freezed,
    Object address2 = freezed,
    Object postalLoc = freezed,
    Object postalCode = freezed,
    Object district = freezed,
    Object state = freezed,
    Object country = freezed,
  }) {
    return _then(_value.copyWith(
      address1: address1 == freezed ? _value.address1 : address1 as String,
      address2: address2 == freezed ? _value.address2 : address2 as String,
      postalLoc: postalLoc == freezed ? _value.postalLoc : postalLoc as String,
      postalCode:
          postalCode == freezed ? _value.postalCode : postalCode as String,
      district: district == freezed ? _value.district : district as String,
      state: state == freezed ? _value.state : state as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

/// @nodoc
abstract class _$AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$AddressCopyWith(_Address value, $Res Function(_Address) then) =
      __$AddressCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.address1) String address1,
      @JsonKey(name: JsonConstants.address2) String address2,
      @JsonKey(name: JsonConstants.postalLoc) String postalLoc,
      @JsonKey(name: JsonConstants.postalCode) String postalCode,
      @JsonKey(name: JsonConstants.district) String district,
      @JsonKey(name: JsonConstants.state) String state,
      @JsonKey(name: JsonConstants.country) String country});
}

/// @nodoc
class __$AddressCopyWithImpl<$Res> extends _$AddressCopyWithImpl<$Res>
    implements _$AddressCopyWith<$Res> {
  __$AddressCopyWithImpl(_Address _value, $Res Function(_Address) _then)
      : super(_value, (v) => _then(v as _Address));

  @override
  _Address get _value => super._value as _Address;

  @override
  $Res call({
    Object address1 = freezed,
    Object address2 = freezed,
    Object postalLoc = freezed,
    Object postalCode = freezed,
    Object district = freezed,
    Object state = freezed,
    Object country = freezed,
  }) {
    return _then(_Address(
      address1: address1 == freezed ? _value.address1 : address1 as String,
      address2: address2 == freezed ? _value.address2 : address2 as String,
      postalLoc: postalLoc == freezed ? _value.postalLoc : postalLoc as String,
      postalCode:
          postalCode == freezed ? _value.postalCode : postalCode as String,
      district: district == freezed ? _value.district : district as String,
      state: state == freezed ? _value.state : state as String,
      country: country == freezed ? _value.country : country as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_Address with DiagnosticableTreeMixin implements _Address {
  _$_Address(
      {@JsonKey(name: JsonConstants.address1) this.address1,
      @JsonKey(name: JsonConstants.address2) this.address2,
      @JsonKey(name: JsonConstants.postalLoc) this.postalLoc,
      @JsonKey(name: JsonConstants.postalCode) this.postalCode,
      @JsonKey(name: JsonConstants.district) this.district,
      @JsonKey(name: JsonConstants.state) this.state,
      @JsonKey(name: JsonConstants.country) this.country});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$_$_AddressFromJson(json);

  @override
  @JsonKey(name: JsonConstants.address1)
  final String address1;
  @override
  @JsonKey(name: JsonConstants.address2)
  final String address2;
  @override
  @JsonKey(name: JsonConstants.postalLoc)
  final String postalLoc;
  @override
  @JsonKey(name: JsonConstants.postalCode)
  final String postalCode;
  @override
  @JsonKey(name: JsonConstants.district)
  final String district;
  @override
  @JsonKey(name: JsonConstants.state)
  final String state;
  @override
  @JsonKey(name: JsonConstants.country)
  final String country;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Address(address1: $address1, address2: $address2, postalLoc: $postalLoc, postalCode: $postalCode, district: $district, state: $state, country: $country)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Address'))
      ..add(DiagnosticsProperty('address1', address1))
      ..add(DiagnosticsProperty('address2', address2))
      ..add(DiagnosticsProperty('postalLoc', postalLoc))
      ..add(DiagnosticsProperty('postalCode', postalCode))
      ..add(DiagnosticsProperty('district', district))
      ..add(DiagnosticsProperty('state', state))
      ..add(DiagnosticsProperty('country', country));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Address &&
            (identical(other.address1, address1) ||
                const DeepCollectionEquality()
                    .equals(other.address1, address1)) &&
            (identical(other.address2, address2) ||
                const DeepCollectionEquality()
                    .equals(other.address2, address2)) &&
            (identical(other.postalLoc, postalLoc) ||
                const DeepCollectionEquality()
                    .equals(other.postalLoc, postalLoc)) &&
            (identical(other.postalCode, postalCode) ||
                const DeepCollectionEquality()
                    .equals(other.postalCode, postalCode)) &&
            (identical(other.district, district) ||
                const DeepCollectionEquality()
                    .equals(other.district, district)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality().equals(other.country, country)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(address1) ^
      const DeepCollectionEquality().hash(address2) ^
      const DeepCollectionEquality().hash(postalLoc) ^
      const DeepCollectionEquality().hash(postalCode) ^
      const DeepCollectionEquality().hash(district) ^
      const DeepCollectionEquality().hash(state) ^
      const DeepCollectionEquality().hash(country);

  @override
  _$AddressCopyWith<_Address> get copyWith =>
      __$AddressCopyWithImpl<_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AddressToJson(this);
  }
}

abstract class _Address implements Address {
  factory _Address(
      {@JsonKey(name: JsonConstants.address1) String address1,
      @JsonKey(name: JsonConstants.address2) String address2,
      @JsonKey(name: JsonConstants.postalLoc) String postalLoc,
      @JsonKey(name: JsonConstants.postalCode) String postalCode,
      @JsonKey(name: JsonConstants.district) String district,
      @JsonKey(name: JsonConstants.state) String state,
      @JsonKey(name: JsonConstants.country) String country}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  @JsonKey(name: JsonConstants.address1)
  String get address1;
  @override
  @JsonKey(name: JsonConstants.address2)
  String get address2;
  @override
  @JsonKey(name: JsonConstants.postalLoc)
  String get postalLoc;
  @override
  @JsonKey(name: JsonConstants.postalCode)
  String get postalCode;
  @override
  @JsonKey(name: JsonConstants.district)
  String get district;
  @override
  @JsonKey(name: JsonConstants.state)
  String get state;
  @override
  @JsonKey(name: JsonConstants.country)
  String get country;
  @override
  _$AddressCopyWith<_Address> get copyWith;
}
