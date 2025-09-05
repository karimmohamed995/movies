// import 'package:json_annotation/json_annotation.dart';
// // import 'package:movies/features/network/model/response/user/user_response.dart';

// part 'token_response.g.dart';

// @JsonSerializable()
// class TokenResponse {
//   final String message;
//   final String? token;

//   TokenResponse({required this.message, this.token});

//   factory TokenResponse.fromJson(Map<String, dynamic> json) {
//     return TokenResponse(
//       message: json['message'] as String,
//       token: json['data'] as String?, // 👈 استعمل data كـ token
//     );
//   }

//   Map<String, dynamic> toJson() => {'message': message, 'token': token};
// }

import 'package:json_annotation/json_annotation.dart';
import 'package:movies/features/network/model/response/user/user_response.dart';

part 'token_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenResponse {
  final String message;
  final String? token;
  final UserResponse? user;

  TokenResponse({required this.message, this.token, this.user});

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    if (data is String) {
      // login response -> token
      return TokenResponse(message: json['message'] as String, token: data);
    } else if (data is Map<String, dynamic>) {
      // sign up response -> user object
      return TokenResponse(
        message: json['message'] as String,
        user: UserResponse.fromJson(data),
      );
    } else {
      return TokenResponse(message: json['message'] as String);
    }
  }

  Map<String, dynamic> toJson() => {
    'message': message,
    'token': token,
    'user': user?.toJson(),
  };
}
