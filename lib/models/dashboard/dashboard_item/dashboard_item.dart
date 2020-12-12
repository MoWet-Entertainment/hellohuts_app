import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hellohuts_app/constants/json_constants.dart';
import 'package:hellohuts_app/helper/utilities.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
part 'dashboard_item.freezed.dart';
part 'dashboard_item.g.dart';

@freezed
abstract class DashboardItem with _$DashboardItem {
  @JsonSerializable(explicitToJson: true)

  factory DashboardItem({
    @JsonKey(name: JsonConstants.itemType, fromJson: DashboardItem._setModeOfTransaction, toJson: DashboardItem._getDashbordItemType)
        DashboardItemType itemType,
    @JsonKey(name: JsonConstants.itemText1) String itemText1,
    @JsonKey(name: JsonConstants.itemText2) String itemText2,
    @JsonKey(
        name: JsonConstants.createdAt,
        fromJson: dateTimeFromUTC,
        toJson:dateTimeToUTC)
    @required
        DateTime createdTimeStamp,
    @JsonKey(name: JsonConstants.updated_at, fromJson: dateTimeFromUTC, toJson: dateTimeToUTC)
        DateTime updatedTimeStamp,
    @JsonKey(name: JsonConstants.createdBy) String createdBy,
    @JsonKey(name: JsonConstants.updatedBy) String updatedBy,
    @JsonKey(name: JsonConstants.providedBy) String providedBy,
  }) = _DashboardItem;



  static DashboardItemType _setModeOfTransaction(String dataVal) {
    if (dataVal == JsonConstants.trasactionRecieved) {
      return DashboardItemType.TransactionReceived;
    } else if (dataVal == JsonConstants.transactionSpent) {
      return DashboardItemType.TransactionSpent;
    } else if (dataVal == JsonConstants.starCoinsRecieved) {
      return DashboardItemType.StarcoinsReceived;
    } else if (dataVal == JsonConstants.starCoinsSpent) {
      return DashboardItemType.StarcoinsSpent;
    } else if (dataVal == JsonConstants.itemDelivered) {
      return DashboardItemType.ItemDelivered;
    } else if (dataVal == JsonConstants.serviceDebit) {
      return DashboardItemType.ServiceDebit;
    } else if (dataVal == JsonConstants.payementReminder) {
      return DashboardItemType.PaymentReminder;
    }
    return null;
  }

  static String _getDashbordItemType(DashboardItemType type) {
    if (type == DashboardItemType.TransactionReceived) {
      return JsonConstants.trasactionRecieved;
    } else if (type == DashboardItemType.TransactionSpent) {
      return JsonConstants.transactionSpent;
    } else if (type == DashboardItemType.StarcoinsReceived) {
      return JsonConstants.starCoinsRecieved;
    } else if (type == DashboardItemType.StarcoinsSpent) {
      return JsonConstants.starCoinsSpent;
    } else if (type == DashboardItemType.ItemDelivered) {
      return JsonConstants.itemDelivered;
    } else if (type == DashboardItemType.ServiceDebit) {
      return JsonConstants.serviceDebit;
    } else if (type == DashboardItemType.PaymentReminder) {
      return JsonConstants.payementReminder;
    }
    return "";
  }

  factory DashboardItem.fromJson(Map<String, dynamic> json) =>
      _$DashboardItemFromJson(json);

  factory DashboardItem.fromFireStore(DocumentSnapshot doc) {
    Map<String, dynamic> json = doc.data();
    return DashboardItem.fromJson(json);
  }
}

enum DashboardItemType {
  TransactionReceived,
  TransactionSpent,
  StarcoinsReceived,
  StarcoinsSpent,
  ItemDelivered,
  ServiceDebit,
  PaymentReminder,
}









