// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Responces _$ResponcesFromJson(Map<String, dynamic> json) => Responces(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$ResponcesToJson(Responces instance) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
};

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['numberOfNotifications'] as String?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numberOfNotifications': instance.numberOfNotifications,
    };

ContactResponces _$ContactResponcesFromJson(Map<String, dynamic> json) =>
    ContactResponces(
      (json['phone'] as num?)?.toInt(),
      json['email'] as String?,
      json['link'] as String?,
    );

Map<String, dynamic> _$ContactResponcesToJson(ContactResponces instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthResponce _$AuthResponceFromJson(Map<String, dynamic> json) => AuthResponce(
  customer: json['customer'] == null
      ? null
      : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
  contact: json['contact'] == null
      ? null
      : ContactResponces.fromJson(json['contact'] as Map<String, dynamic>),
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$AuthResponceToJson(AuthResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contact': instance.contact,
    };
