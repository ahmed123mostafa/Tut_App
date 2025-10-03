import 'package:json_annotation/json_annotation.dart';

part 'responces.g.dart';

@JsonSerializable()
class Responces {
  @JsonKey(name: "status")
  int? status;

  @JsonKey(name: "message")
  String? message;

  Responces({this.status, this.message});

  factory Responces.fromJson(Map<String, dynamic> json) =>
      _$ResponcesFromJson(json);

  Map<String, dynamic> toJson() => _$ResponcesToJson(this);
}

@JsonSerializable()
class CustomerResponce {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numberOfNotifications")
  String? numberOfNotifications;

  CustomerResponce(this.id, this.name, this.numberOfNotifications);
//from json
  factory CustomerResponce.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponceFromJson(json);
//to json
  Map<String, dynamic> toJson() => _$CustomerResponceToJson(this);
}

@JsonSerializable()
class ContactResponces {
  @JsonKey(name: "phone")
  int? phone;

  @JsonKey(name: "email")
  String? email;

  @JsonKey(name: "link")
  String? link;

  ContactResponces(this.phone, this.email, this.link);

  factory ContactResponces.fromJson(Map<String, dynamic> json) =>
      _$ContactResponcesFromJson(json);

  Map<String, dynamic> toJson() => _$ContactResponcesToJson(this);
}

@JsonSerializable()
class AuthResponce extends Responces {
  @JsonKey(name: "customer")
  CustomerResponce? customer;

  @JsonKey(name: "contact")
  ContactResponces? contact;

   AuthResponce({this.customer, this.contact, super.status, super.message});
//from json
  factory AuthResponce.fromJson(Map<String, dynamic> json) =>
      _$AuthResponceFromJson(json);


//to json
  @override
  Map<String, dynamic> toJson() => _$AuthResponceToJson(this);
}
