import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_user.freezed.dart';
part 'app_user.g.dart';

@freezed
abstract class AppUser with _$AppUser {
  @JsonSerializable(explicitToJson: true)
  factory AppUser({
    @JsonKey(name: JsonConstants.userId) @required String uid,
    @JsonKey(name: JsonConstants.email) @required String email,
    @JsonKey(name: JsonConstants.displayName) String displayName,
    @JsonKey(name: JsonConstants.phoneNumber) String phoneNumber,
    @JsonKey(name: JsonConstants.userRole) String userRole,
    @JsonKey(name:JsonConstants.userPhotoUrl)String photoUrl,
    @JsonKey(name: JsonConstants.isEmailVerified) bool isEmailVerified,
    @JsonKey(name: JsonConstants.createdAt) String createdAt,
    @JsonKey(name: JsonConstants.profLastUpdatedAt) String profLastUpdatedAt,
    @JsonKey(name: JsonConstants.lastLoginAt) String lastLoginAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  factory AppUser.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return AppUser.fromJson(json);
  }
}
