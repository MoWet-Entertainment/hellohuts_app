import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:flutter/foundation.dart';

part 'address.freezed.dart';
part 'address.g.dart';

@freezed
abstract class Address with _$Address {
  @JsonSerializable(explicitToJson: true)
  factory Address({
    @JsonKey(name: JsonConstants.address1) String address1,
    @JsonKey(name: JsonConstants.address2) String address2,
    @JsonKey(name: JsonConstants.postalLoc) String postalLoc,
    @JsonKey(name: JsonConstants.postalCode) String postalCode,
    @JsonKey(name: JsonConstants.district) String district,
    @JsonKey(name: JsonConstants.state) String state,
    @JsonKey(name: JsonConstants.country) String country,
  }) = _Address;

   factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  factory Address.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return Address.fromJson(json);
  }
}
