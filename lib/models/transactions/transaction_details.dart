import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:hellohuts_app/constants/json_constants.dart';

enum ModeOfTransaction {
  Cash,
  Account,
}

class TransactionDetails extends Equatable {
  final String transactionFromAccountNo;
  final String transactionToAccountNo;
  final ModeOfTransaction modeOfTransaction;

  TransactionDetails({
    this.transactionFromAccountNo,
    this.transactionToAccountNo,
    @required this.modeOfTransaction,
  });

  Map<String, dynamic> toJson() {
    return {
      JsonConstants.transactionFromaccountNo: this.transactionFromAccountNo ?? null,
      JsonConstants.transactionToAccountNo: this.transactionToAccountNo ?? null,
    JsonConstants.modeOfTransaction: _getModeOfTransaction(this.modeOfTransaction),
    };
  }

  TransactionDetails.fromData(Map<String, dynamic> data)
      : transactionFromAccountNo = data[ JsonConstants.transactionFromaccountNo],
        transactionToAccountNo = data[    JsonConstants.transactionToAccountNo],
        modeOfTransaction = _setModeOfTransaction(data[JsonConstants.modeOfTransaction]);

  static ModeOfTransaction _setModeOfTransaction(String dataVal) {
    if (dataVal == 'account') {
      return ModeOfTransaction.Account;
    } else if (dataVal == 'cash') {
      return ModeOfTransaction.Cash;
    }
    return null;
  }

  String _getModeOfTransaction(ModeOfTransaction modeOfTransaction) {
    if (modeOfTransaction == ModeOfTransaction.Account) {
      return "account";
    } else if (modeOfTransaction == ModeOfTransaction.Cash) {
      return "cash";
    }
    return "";
  }

  @override
  List<Object> get props => [
        this.transactionFromAccountNo,
        this.transactionToAccountNo,
        this.modeOfTransaction,
      ];

  @override
  String toString() {
    return 'TransactionDetails{transactionFromAccountNo: $transactionFromAccountNo, transactionToAccountNo: $transactionToAccountNo, modeOfTransaction: $modeOfTransaction}';
  }


}
