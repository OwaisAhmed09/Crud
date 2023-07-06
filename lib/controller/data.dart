// To parse this JSON data, do
//
//     final crudapi = crudapiFromJson(jsonString);

import 'dart:convert';

Crudapi crudapiFromJson(String str) => Crudapi.fromJson(json.decode(str));

String crudapiToJson(Crudapi data) => json.encode(data.toJson());

class Crudapi {
  Crudapi({
    this.success,
    this.data,
  });

  bool? success;
  List<Datum>? data;

  factory Crudapi.fromJson(Map<String, dynamic> json) => Crudapi(
        success: json["success"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.website,
    this.company,
    this.address,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  dynamic website;
  Company? company;
  Address? address;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        website: json["website"],
        company:
            json["company"] == null ? null : Company.fromJson(json["company"]),
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "phone": phone,
        "website": website,
        "company": company?.toJson(),
        "address": address?.toJson(),
      };
}

class Address {
  Address({
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  });

  dynamic street;
  dynamic suite;
  dynamic city;
  dynamic zipcode;
  Geo? geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: json["geo"] == null ? null : Geo.fromJson(json["geo"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo?.toJson(),
      };
}

class Geo {
  Geo({
    this.lat,
    this.lng,
  });

  dynamic lat;
  dynamic lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"],
        lng: json["lng"],
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    this.name,
    this.catchPhrase,
    this.bs,
  });

  dynamic name;
  dynamic catchPhrase;
  dynamic bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
