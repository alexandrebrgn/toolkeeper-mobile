import 'dart:convert';
import 'dart:developer' as developer;
import 'package:shared_preferences/shared_preferences.dart';

import 'api.dart';
import 'api_response.dart';

class Auth {

  static Future<bool> attempt(Map<String, String> credentials) async {
    // developer.log('Auth - attempt() :\n Credentials : ${credentials.toString()}');
    // await Api.post(route: '/login', bodyParams: credentials);
    // return true;
    developer.log('Auth - attempt() :\n Credentials: ${credentials.toString()}');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final resp = await Api.post(route: '/login', bodyParams: credentials);

    if (resp.status == Status.COMPLETED) {
      Map<String, dynamic> response = jsonDecode(resp.data);

      if (response.containsKey('success')) {
        developer.log("Auth - attempt() :\n\t Token : ${response['success']['token']}");
        Api.token = response['success']['token'];
        prefs.setString('token', Api.token);
        prefs.setString('email', response['success']['email']);
        developer.log('Auth - attempt - sharedPrefreences(email) : ${prefs.get('email')}');
        return true;
      }
    }
    developer.log("Auth - attempt() : invalid credentials or API errors");
    prefs.setString('token', '');
    return false;
  }
}