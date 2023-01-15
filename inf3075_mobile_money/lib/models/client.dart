class Client {
  int? id;
  String? phoneNber;
  String? name;

  int? get getID {
    return id;
  }

  set setID(int id) {
    this.id = id;
  }

  String? get getphoneNber {
    return phoneNber;
  }

  set setPhoneNber(String phoneNber) {
    this.phoneNber = phoneNber;
  }

  String? get getName {
    return name;
  }

  set setName(String name) {
    this.name = name;
  }

  Client({this.id, required this.name, required this.phoneNber});

  Client.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phoneNber = json['Numero'];
    name = json['Nom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Numero'] = phoneNber;
    data['Nom'] = name;
    return data;
  }
}
