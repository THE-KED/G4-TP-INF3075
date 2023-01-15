import 'account.dart';

class Transaction {
  int? id;
  String? description;
  DateTime? date;
  double? amount;
  Account? sender;
  Account? receiver;

  bool? transactionType; //true for deposit and false for withdrawal

  Transaction({
    this.id,
    required this.description,
    required this.amount,
    required this.date,
    required this.receiver,
    required this.sender,
    required this.transactionType,
  });

  int? get getID {
    return id;
  }

  set setID(int id) {
    this.id = id;
  }

  String? get getDescription {
    return description;
  }

  set setDescription(String description) {
    this.description = description;
  }

  double? get getAmount {
    return amount;
  }

  set setAmount(double amount) {
    this.amount = amount;
  }

  DateTime? get getDate {
    return date;
  }

  set setDate(DateTime date) {
    this.date = date;
  }

  Account? get getSender {
    return sender;
  }

  set setSender(Account sender) {
    this.sender = sender;
  }

  Account? get getReceiver {
    return receiver;
  }

  set setReceiver(Account receiver) {
    this.receiver = receiver;
  }

  bool? get getTransactionType {
    return transactionType;
  }

  set setTransactionType(bool type) {
    transactionType = type;
  }

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['Description'];
    date = json['Date'];
    amount = json['Montant'];
    sender = json['Envoyeur'];
    receiver = json['Receptionneur'];
    transactionType = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Description'] = description;
    data['Date'] = date;
    data['Montant'] = amount;
    data['Envoyeur'] = sender;
    data['Receptionneur'] = receiver;
    data['Type'] = transactionType;
    return data;
  }
}
