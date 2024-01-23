import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../model/auth.dart';

class LoginViewModel extends ChangeNotifier {

  LoginViewModel();

  // Future<bool> signInButtonOnClickCommand(String email, String password) async {
  //   developer.log("LoginViewModel - signInButtonOnClickCommand()");
  //   developer.log("LoginViewModel - Email : "+email+" / Password : "+password);
  //   return await Auth.attempt({'email' : email, 'password' : password});
  // }

  Future<bool> signInButtonOnClickCommand(String email, String password) async{
    developer.log("LoginViewModel - signInButtonOnClickCommand()");
    developer.log("LoginViewModel - Email : "+email+" / Password : "+password);
    return Auth.attempt({'email': email, 'password': password});
  }
}
