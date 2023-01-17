import 'account.dart';

class Transaction {
  int? id;
  bool? type; //true for deposit and false for withdrawal
  String? description;
  String? date;
  String? numReceptionneur;
  String? nameSend;
  String? nameRec;
  double? solde;
  String? numenvoyeur;
  double? montant;

  Transaction({
    this.id,
    this.description,
    this.date,
    this.type,
    this.numReceptionneur,
    this.nameRec,
    this.solde,
    this.numenvoyeur,
    this.montant,
    this.nameSend,
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

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      id: json['id'],
      description: json['description'],
      solde: json['solde'],
      type: json['type'],
      numReceptionneur: json['numReceptionneur'],
      nameRec: json['nameRec'],
      date: json['date'],
      numenvoyeur: json['numenvoyeur'],
      nameSend: json['nameSend'],
      montant: json['montant'],
    );
  }
}
