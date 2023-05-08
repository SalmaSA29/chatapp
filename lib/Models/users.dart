class Taltmra {
  List<Users>? users;

  Taltmra({this.users});

  Taltmra.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        // users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.users != null) {
      // data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  Address? address;
  String name;
  int age;

  Users({ this.address,required this.name,required this.age});

  // Users.fromJson(Map<String, dynamic> json) {
  //   address =
  //   (json['address'] != null ? new Address.fromJson(json['address']) : null)!;
  //   name = json['name'];
  //   age = json['age'];
  // }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.address != null) {
  //     data['address'] = this.address!.toJson();
  //   }
  //   data['name'] = this.name;
  //   data['age'] = this.age;
  //   return data;
  // }

}

class Address {
  String? line1;

  Address({required this.line1});

  Address.fromJson(Map<String, dynamic> json) {
    line1 = json['line1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['line1'] = this.line1;
    return data;
  }
}