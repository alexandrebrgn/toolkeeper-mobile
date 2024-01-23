import 'dart:developer' as developer;
import 'api.dart';

class Auth {

  static Future<bool> attempt(Map<String, String> credentials) async{
    developer.log('Auth - attempt() :\n Credentials : ${credentials.toString()}');
    await Api.post(route: '/login', bodyParams: credentials);
    return true;
  }
}