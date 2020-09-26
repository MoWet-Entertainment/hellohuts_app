import 'package:equatable/equatable.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:meta/meta.dart';

class AppUser extends Equatable {
   AppUser({
    @required this.uid,
    @required this.email,
    this.photoUrl,
    this.displayName,
    this.phoneNumber,
    this.userRole,
    this.isEmailVerified,
    this.createdAt,
    this.profLastUpdatedAt,
    this.lastLoginAt,
  });

   String uid;
   String email;
   String photoUrl;
   String displayName;
   String phoneNumber;
   String userRole;
   bool isEmailVerified;
   String createdAt;
   String profLastUpdatedAt;
   String lastLoginAt;

  AppUser.fromJson(Map<String, dynamic> data) {
    
    uid = data[JsonConstants.userId];
    email = data[JsonConstants.email];
    photoUrl = data[JsonConstants.photoUrl];
    displayName = data[JsonConstants.displayName];
    phoneNumber = data[JsonConstants.phoneNumber];
    userRole = data[JsonConstants.userRole];
    isEmailVerified = data[JsonConstants.isEmailVerified];
    createdAt = data[JsonConstants.createdAt];
    profLastUpdatedAt = data[JsonConstants.profLastUpdatedAt];
    lastLoginAt = data[JsonConstants.lastLoginAt];
  }

  Map<String, dynamic> toJson() {
    return {
      JsonConstants.userId: this.uid,
      JsonConstants.email: this.email,
      JsonConstants.phoneNumber: this.phoneNumber,
      JsonConstants.photoUrl: this.photoUrl,
      JsonConstants.displayName: this.displayName,
      JsonConstants.userRole: this.userRole,
      JsonConstants.isEmailVerified: this.isEmailVerified,
      JsonConstants.createdAt: this.createdAt,
      JsonConstants.profLastUpdatedAt: this.profLastUpdatedAt,
      JsonConstants.lastLoginAt: this.lastLoginAt,
    };
  }

  AppUser copyWith({
    String uid,
    String email,
    String userRole,
    bool isEmailVerified,
    String phoneNumber,
    String displayName,
    String photoUrl,
    String createdAt,
    String profLastUpdatedAt,
    String lastLoginAt,
  }) {
    return AppUser(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      displayName: displayName ?? this.displayName,
      photoUrl: photoUrl ?? this.photoUrl,
      userRole: userRole ?? this.userRole,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      createdAt: createdAt ?? this.createdAt,
      lastLoginAt: lastLoginAt ?? this.lastLoginAt,
      profLastUpdatedAt: profLastUpdatedAt ?? this.profLastUpdatedAt,
    );
  }

  @override
  List<Object> get props => [
        this.uid,
        this.email,
        this.photoUrl,
        this.displayName,
        this.phoneNumber,
        this.userRole,
        this.isEmailVerified,
        this.createdAt,
        this.profLastUpdatedAt,
        this.lastLoginAt,
      ];

   @override
   String toString() {
     return 'AppUser{uid: $uid, email: $email, photoUrl: $photoUrl, displayName: $displayName, phoneNumber: $phoneNumber, userRole: $userRole, isEmailVerified: $isEmailVerified, createdAt: $createdAt, profLastUpdatedAt: $profLastUpdatedAt, lastLoginAt: $lastLoginAt}';
   }
}
