import 'client.dart';

class Account {
  int? id;
  late Client client;
  late String pin;
  late String initialDate;
  late double balance;

  Account({
    this.id,
    required this.client,
    required this.pin,
    required this.balance,
    required this.initialDate,
  });

  Account.fromAccount(String pin, String initDate) {
    this.pin = "00000";
    initialDate = initDate;
  }

  int? get getID {
    return id;
  }

  set setID(int id) {
    this.id = id;
  }

  Client? get getClient {
    return client;
  }

  set setClient(Client client) {
    this.client = client;
  }

  String? get getPin {
    return pin;
  }

  set setPin(String pin) {
    this.pin = pin;
  }

  String? get getInitDate {
    return initialDate;
  }

  set setInitDate(String initDate) {
    initialDate = initDate;
  }

  double? get getBalance {
    return balance;
  }

  set setBalance(double balance) {
    this.balance = balance;
  }

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client.name = json['nom'];
    client.phoneNber = json['numero'];
    pin = json['Pin'];
    initialDate = json['InitialDate'];
    balance = json['Balance'];
  }

  Account.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client = json['Client'];
    pin = json['Pin'];
    initialDate = json['InitialDate'];
    balance = json['Balance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Client'] = client;
    data['Pin'] = pin;
    data['InitialDate'] = initialDate;
    data['Balance'] = balance;
    return data;
  }
}
