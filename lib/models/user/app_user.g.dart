// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AppUser _$_$_AppUserFromJson(Map<String, dynamic> json) {
  return _$_AppUser(
    uid: json['uid'] as String,
    email: json['email'] as String,
    displayName: json['display_name'] as String,
    phoneNumber: json['phone_number'] as String,
    userRole: json['user_role'] as String,
    photoUrl: json['user_photo_url'] as String,
    isEmailVerified: json['is_email_verified'] as bool,
    createdAt: json['created_at'] as String,
    profLastUpdatedAt: json['prof_last_updated_at'] as String,
    lastLoginAt: json['last_login_at'] as String,
  );
}

Map<String, dynamic> _$_$_AppUserToJson(_$_AppUser instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'display_name': instance.displayName,
      'phone_number': instance.phoneNumber,
      'user_role': instance.userRole,
      'user_photo_url': instance.photoUrl,
      'is_email_verified': instance.isEmailVerified,
      'created_at': instance.createdAt,
      'prof_last_updated_at': instance.profLastUpdatedAt,
      'last_login_at': instance.lastLoginAt,
    };
