import 'package:json_annotation/json_annotation.dart';
@JsonSerializable()

class Responces {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;

}
class CustomerResponce {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? 
  name;
  @JsonKey(name: "numberOfNotifications")
  String?  numberOfNotifications;

}
class ContactResponces {
  @JsonKey(name: "phone")
  int? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;

}
class AuthResponce extends Responces {
  @JsonKey(name: "customer")
  CustomerResponce? customer;
  @JsonKey(name: "contact")
  ContactResponces? contact;
}