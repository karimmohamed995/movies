import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:movies/features/network/model/response/user/user_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SharedPrefHelper {
  Future<void> saveUser(UserResponse user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var json = user.toJson();
    prefs.setString("user", jsonEncode(json)); //////// convert json to string
  }

  Future<void> saveToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
  }

  Future<UserResponse?> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var encodedJson = prefs.getString("user");
    if (encodedJson == null) return null;
    var json = jsonDecode(encodedJson);
    return UserResponse.fromJson(json);
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}
