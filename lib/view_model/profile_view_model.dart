import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import '../model/user.dart';
import '../model/user_dao.dart';

class ProfileViewModel extends ChangeNotifier {
  late Future<User?> selectedUser;

  ProfileViewModel();

  Future<bool> readUser(int toolId) async {
    developer.log('UserViewModel - readUser($toolId)');
    selectedUser = UserDAO.find(toolId);
    if (selectedUser!=null) {
      developer.log('UserViewModel - ReadUser() : success $selectedUser');
      notifyListeners();
      return true;
    }
    return false;
  }
}