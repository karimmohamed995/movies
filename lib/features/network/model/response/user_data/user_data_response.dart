import 'package:json_annotation/json_annotation.dart';

part 'user_data_response.g.dart';

@JsonSerializable()
class UserDataResponse {
  final String email;
  final String password; // لاحظ: السيرفر بيرجع الـ password مشفرة
  final String name;
  final String phone;
  final int avaterId;
  @JsonKey(name: "_id")
  final String id;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: "__v")
  final int v;

  UserDataResponse({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataResponseToJson(this);
}
