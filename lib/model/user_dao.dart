import 'dart:convert';
import 'package:campus/model/api_response.dart';
import './tool.dart';
import 'dart:developer' as developer;

import 'api.dart';
import '../functions/jsonPrinter.dart';
import 'user.dart';

class UserDAO {
  static Future<List<User>> all() async{
    developer.log('UserDAO - all()');

    final resp = await Api.get(route: '/tool', urlParams: null, token: true);

    if (resp.status == Status.COMPLETED) {
      developer.log('UserDAO - all() : API is responding : ${resp.message}');//\n\t Data : ${resp.data}\n\tMessage ${resp.message}');

      return jsonDecode(resp.data).map<User>((item) => User.fromJSON(item)).toList();
    }
    developer.log('UserDAO - all() : Error, no data find on route GET /tool');
    return List.empty();
  }

  static Future<User?> find(int id) async{
    developer.log('UserDAO - find($id)');

    final resp = await Api.get(
        route: '/tool/$id', token: true
    );

    if (resp.status == Status.COMPLETED) {
      developer.log('UserDAO - find($id) : ${jsonDecode(resp.data)['number']}');
      User tool = User.fromJSON(jsonDecode(resp.data));
      developer.log('UserDAO - find($id) : $tool');
      return tool;
    }

    developer.log('UserDAO - find() : Error, no data find on route GET /tool');
    return null;
  }
}