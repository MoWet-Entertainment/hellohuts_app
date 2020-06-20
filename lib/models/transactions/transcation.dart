import 'package:equatable/equatable.dart';
import 'package:hellohuts_app/models/transactions/transaction_details.dart';
import 'package:meta/meta.dart';
import 'package:hellohuts_app/constants/json_constants.dart';

enum TranscationType {
  CreditedFromClient,
  ExpenseForProject,
}
enum TransactionStatus {
  Success,
  Pending,
  Failed,
}

class Transaction extends Equatable {
  final TranscationType transcationType;
  final DateTime dateTime;
  final double amount;
  final TransactionStatus transactionStatus;
  final TransactionDetails transactionDetails;

  Transaction(
      {@required this.transcationType,
      @required this.dateTime,
      @required this.amount,
      @required this.transactionStatus,
      @required this.transactionDetails});

  Transaction.fromData(Map<String, dynamic> data)
      : transcationType = data[JsonConstants.transactionType],
        dateTime = data[JsonConstants.timeStamp],
        amount = data[JsonConstants.amount],
        transactionStatus = data[JsonConstants.transactionStatus],
        transactionDetails = data[JsonConstants.transactionDetails];

  Map<String, dynamic> toJson() {
    return {
      JsonConstants.transactionType: this.transcationType,
    JsonConstants.timeStamp : this.dateTime,
    JsonConstants.amount : this.amount,
     JsonConstants.transactionStatus : this.transactionStatus,
     JsonConstants.transactionDetails : this.transactionDetails,
    };
  }

  @override
  List<Object> get props => [
        this.transcationType,
        this.dateTime,
        this.amount,
        this.transactionDetails,
        this.transactionStatus,
      ];

  @override
  String toString() {
    return 'Transaction{transcationType: $transcationType, dateTime: $dateTime, amount: $amount, transactionStatus: $transactionStatus, transactionDetails: $transactionDetails}';
  }


}
