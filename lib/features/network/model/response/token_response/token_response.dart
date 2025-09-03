import 'package:json_annotation/json_annotation.dart';
// import 'package:movies/features/network/model/response/user/user_response.dart';

part 'token_response.g.dart';

@JsonSerializable()
class TokenResponse {
  final String message;
  final String? token;

  TokenResponse({required this.message, this.token});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      message: json['message'] as String,
      token: json['data'] as String?, // 👈 استعمل data كـ token
    );
  }

  Map<String, dynamic> toJson() => {'message': message, 'token': token};
}
