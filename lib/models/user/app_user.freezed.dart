// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
AppUser _$AppUserFromJson(Map<String, dynamic> json) {
  return _AppUser.fromJson(json);
}

/// @nodoc
class _$AppUserTearOff {
  const _$AppUserTearOff();

// ignore: unused_element
  _AppUser call(
      {@required @JsonKey(name: JsonConstants.userId) String uid,
      @required @JsonKey(name: JsonConstants.email) String email,
      @JsonKey(name: JsonConstants.displayName) String displayName,
      @JsonKey(name: JsonConstants.phoneNumber) String phoneNumber,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userPhotoUrl) String photoUrl,
      @JsonKey(name: JsonConstants.isEmailVerified) bool isEmailVerified,
      @JsonKey(name: JsonConstants.createdAt) String createdAt,
      @JsonKey(name: JsonConstants.profLastUpdatedAt) String profLastUpdatedAt,
      @JsonKey(name: JsonConstants.lastLoginAt) String lastLoginAt}) {
    return _AppUser(
      uid: uid,
      email: email,
      displayName: displayName,
      phoneNumber: phoneNumber,
      userRole: userRole,
      photoUrl: photoUrl,
      isEmailVerified: isEmailVerified,
      createdAt: createdAt,
      profLastUpdatedAt: profLastUpdatedAt,
      lastLoginAt: lastLoginAt,
    );
  }

// ignore: unused_element
  AppUser fromJson(Map<String, Object> json) {
    return AppUser.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $AppUser = _$AppUserTearOff();

/// @nodoc
mixin _$AppUser {
  @JsonKey(name: JsonConstants.userId)
  String get uid;
  @JsonKey(name: JsonConstants.email)
  String get email;
  @JsonKey(name: JsonConstants.displayName)
  String get displayName;
  @JsonKey(name: JsonConstants.phoneNumber)
  String get phoneNumber;
  @JsonKey(name: JsonConstants.userRole)
  String get userRole;
  @JsonKey(name: JsonConstants.userPhotoUrl)
  String get photoUrl;
  @JsonKey(name: JsonConstants.isEmailVerified)
  bool get isEmailVerified;
  @JsonKey(name: JsonConstants.createdAt)
  String get createdAt;
  @JsonKey(name: JsonConstants.profLastUpdatedAt)
  String get profLastUpdatedAt;
  @JsonKey(name: JsonConstants.lastLoginAt)
  String get lastLoginAt;

  Map<String, dynamic> toJson();
  @JsonKey(ignore: true)
  $AppUserCopyWith<AppUser> get copyWith;
}

/// @nodoc
abstract class $AppUserCopyWith<$Res> {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) then) =
      _$AppUserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: JsonConstants.userId) String uid,
      @JsonKey(name: JsonConstants.email) String email,
      @JsonKey(name: JsonConstants.displayName) String displayName,
      @JsonKey(name: JsonConstants.phoneNumber) String phoneNumber,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userPhotoUrl) String photoUrl,
      @JsonKey(name: JsonConstants.isEmailVerified) bool isEmailVerified,
      @JsonKey(name: JsonConstants.createdAt) String createdAt,
      @JsonKey(name: JsonConstants.profLastUpdatedAt) String profLastUpdatedAt,
      @JsonKey(name: JsonConstants.lastLoginAt) String lastLoginAt});
}

/// @nodoc
class _$AppUserCopyWithImpl<$Res> implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._value, this._then);

  final AppUser _value;
  // ignore: unused_field
  final $Res Function(AppUser) _then;

  @override
  $Res call({
    Object uid = freezed,
    Object email = freezed,
    Object displayName = freezed,
    Object phoneNumber = freezed,
    Object userRole = freezed,
    Object photoUrl = freezed,
    Object isEmailVerified = freezed,
    Object createdAt = freezed,
    Object profLastUpdatedAt = freezed,
    Object lastLoginAt = freezed,
  }) {
    return _then(_value.copyWith(
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      userRole: userRole == freezed ? _value.userRole : userRole as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      profLastUpdatedAt: profLastUpdatedAt == freezed
          ? _value.profLastUpdatedAt
          : profLastUpdatedAt as String,
      lastLoginAt:
          lastLoginAt == freezed ? _value.lastLoginAt : lastLoginAt as String,
    ));
  }
}

/// @nodoc
abstract class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) then) =
      __$AppUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: JsonConstants.userId) String uid,
      @JsonKey(name: JsonConstants.email) String email,
      @JsonKey(name: JsonConstants.displayName) String displayName,
      @JsonKey(name: JsonConstants.phoneNumber) String phoneNumber,
      @JsonKey(name: JsonConstants.userRole) String userRole,
      @JsonKey(name: JsonConstants.userPhotoUrl) String photoUrl,
      @JsonKey(name: JsonConstants.isEmailVerified) bool isEmailVerified,
      @JsonKey(name: JsonConstants.createdAt) String createdAt,
      @JsonKey(name: JsonConstants.profLastUpdatedAt) String profLastUpdatedAt,
      @JsonKey(name: JsonConstants.lastLoginAt) String lastLoginAt});
}

/// @nodoc
class __$AppUserCopyWithImpl<$Res> extends _$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(_AppUser _value, $Res Function(_AppUser) _then)
      : super(_value, (v) => _then(v as _AppUser));

  @override
  _AppUser get _value => super._value as _AppUser;

  @override
  $Res call({
    Object uid = freezed,
    Object email = freezed,
    Object displayName = freezed,
    Object phoneNumber = freezed,
    Object userRole = freezed,
    Object photoUrl = freezed,
    Object isEmailVerified = freezed,
    Object createdAt = freezed,
    Object profLastUpdatedAt = freezed,
    Object lastLoginAt = freezed,
  }) {
    return _then(_AppUser(
      uid: uid == freezed ? _value.uid : uid as String,
      email: email == freezed ? _value.email : email as String,
      displayName:
          displayName == freezed ? _value.displayName : displayName as String,
      phoneNumber:
          phoneNumber == freezed ? _value.phoneNumber : phoneNumber as String,
      userRole: userRole == freezed ? _value.userRole : userRole as String,
      photoUrl: photoUrl == freezed ? _value.photoUrl : photoUrl as String,
      isEmailVerified: isEmailVerified == freezed
          ? _value.isEmailVerified
          : isEmailVerified as bool,
      createdAt: createdAt == freezed ? _value.createdAt : createdAt as String,
      profLastUpdatedAt: profLastUpdatedAt == freezed
          ? _value.profLastUpdatedAt
          : profLastUpdatedAt as String,
      lastLoginAt:
          lastLoginAt == freezed ? _value.lastLoginAt : lastLoginAt as String,
    ));
  }
}

@JsonSerializable(explicitToJson: true)

/// @nodoc
class _$_AppUser implements _AppUser {
  _$_AppUser(
      {@required @JsonKey(name: JsonConstants.userId) this.uid,
      @required @JsonKey(name: JsonConstants.email) this.email,
      @JsonKey(name: JsonConstants.displayName) this.displayName,
      @JsonKey(name: JsonConstants.phoneNumber) this.phoneNumber,
      @JsonKey(name: JsonConstants.userRole) this.userRole,
      @JsonKey(name: JsonConstants.userPhotoUrl) this.photoUrl,
      @JsonKey(name: JsonConstants.isEmailVerified) this.isEmailVerified,
      @JsonKey(name: JsonConstants.createdAt) this.createdAt,
      @JsonKey(name: JsonConstants.profLastUpdatedAt) this.profLastUpdatedAt,
      @JsonKey(name: JsonConstants.lastLoginAt) this.lastLoginAt})
      : assert(uid != null),
        assert(email != null);

  factory _$_AppUser.fromJson(Map<String, dynamic> json) =>
      _$_$_AppUserFromJson(json);

  @override
  @JsonKey(name: JsonConstants.userId)
  final String uid;
  @override
  @JsonKey(name: JsonConstants.email)
  final String email;
  @override
  @JsonKey(name: JsonConstants.displayName)
  final String displayName;
  @override
  @JsonKey(name: JsonConstants.phoneNumber)
  final String phoneNumber;
  @override
  @JsonKey(name: JsonConstants.userRole)
  final String userRole;
  @override
  @JsonKey(name: JsonConstants.userPhotoUrl)
  final String photoUrl;
  @override
  @JsonKey(name: JsonConstants.isEmailVerified)
  final bool isEmailVerified;
  @override
  @JsonKey(name: JsonConstants.createdAt)
  final String createdAt;
  @override
  @JsonKey(name: JsonConstants.profLastUpdatedAt)
  final String profLastUpdatedAt;
  @override
  @JsonKey(name: JsonConstants.lastLoginAt)
  final String lastLoginAt;

  @override
  String toString() {
    return 'AppUser(uid: $uid, email: $email, displayName: $displayName, phoneNumber: $phoneNumber, userRole: $userRole, photoUrl: $photoUrl, isEmailVerified: $isEmailVerified, createdAt: $createdAt, profLastUpdatedAt: $profLastUpdatedAt, lastLoginAt: $lastLoginAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AppUser &&
            (identical(other.uid, uid) ||
                const DeepCollectionEquality().equals(other.uid, uid)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.userRole, userRole) ||
                const DeepCollectionEquality()
                    .equals(other.userRole, userRole)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.isEmailVerified, isEmailVerified) ||
                const DeepCollectionEquality()
                    .equals(other.isEmailVerified, isEmailVerified)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.profLastUpdatedAt, profLastUpdatedAt) ||
                const DeepCollectionEquality()
                    .equals(other.profLastUpdatedAt, profLastUpdatedAt)) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                const DeepCollectionEquality()
                    .equals(other.lastLoginAt, lastLoginAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(uid) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(userRole) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(isEmailVerified) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(profLastUpdatedAt) ^
      const DeepCollectionEquality().hash(lastLoginAt);

  @JsonKey(ignore: true)
  @override
  _$AppUserCopyWith<_AppUser> get copyWith =>
      __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_AppUserToJson(this);
  }
}

abstract class _AppUser implements AppUser {
  factory _AppUser(
      {@required
      @JsonKey(name: JsonConstants.userId)
          String uid,
      @required
      @JsonKey(name: JsonConstants.email)
          String email,
      @JsonKey(name: JsonConstants.displayName)
          String displayName,
      @JsonKey(name: JsonConstants.phoneNumber)
          String phoneNumber,
      @JsonKey(name: JsonConstants.userRole)
          String userRole,
      @JsonKey(name: JsonConstants.userPhotoUrl)
          String photoUrl,
      @JsonKey(name: JsonConstants.isEmailVerified)
          bool isEmailVerified,
      @JsonKey(name: JsonConstants.createdAt)
          String createdAt,
      @JsonKey(name: JsonConstants.profLastUpdatedAt)
          String profLastUpdatedAt,
      @JsonKey(name: JsonConstants.lastLoginAt)
          String lastLoginAt}) = _$_AppUser;

  factory _AppUser.fromJson(Map<String, dynamic> json) = _$_AppUser.fromJson;

  @override
  @JsonKey(name: JsonConstants.userId)
  String get uid;
  @override
  @JsonKey(name: JsonConstants.email)
  String get email;
  @override
  @JsonKey(name: JsonConstants.displayName)
  String get displayName;
  @override
  @JsonKey(name: JsonConstants.phoneNumber)
  String get phoneNumber;
  @override
  @JsonKey(name: JsonConstants.userRole)
  String get userRole;
  @override
  @JsonKey(name: JsonConstants.userPhotoUrl)
  String get photoUrl;
  @override
  @JsonKey(name: JsonConstants.isEmailVerified)
  bool get isEmailVerified;
  @override
  @JsonKey(name: JsonConstants.createdAt)
  String get createdAt;
  @override
  @JsonKey(name: JsonConstants.profLastUpdatedAt)
  String get profLastUpdatedAt;
  @override
  @JsonKey(name: JsonConstants.lastLoginAt)
  String get lastLoginAt;
  @override
  @JsonKey(ignore: true)
  _$AppUserCopyWith<_AppUser> get copyWith;
}
