import 'dart:convert';
import 'package:campus/model/api_response.dart';

import './tool.dart';
import 'dart:developer' as developer;

import 'api.dart';

class ToolDAO {
  static Future<List<Tool>> all() async{
    developer.log('ToolDAO - all()');

    final resp = await Api.get(route: '/tool', urlParams: null, token: true);

    if (resp.status == Status.COMPLETED) {
      developer.log('ToolDAO - all() : API is responding :\n\t Data : ${resp.data}\n\tMessage ${resp.message}');

      return jsonDecode(resp.data).map<Tool>((item) => Tool.fromJSON(item)).toList();
    }
    developer.log('ToolDAO - all() : Error, no data find on route GET /tool');
    return List.empty();
  }
}