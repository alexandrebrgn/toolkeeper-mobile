import 'dart:convert';
import 'package:campus/model/api_response.dart';
import './tool.dart';
import 'dart:developer' as developer;

import 'api.dart';
import '../functions/jsonPrinter.dart';

class ToolDAO {
  static Future<List<Tool>> all() async{
    developer.log('ToolDAO - all()');

    final resp = await Api.get(route: '/tool', urlParams: null, token: true);

    if (resp.status == Status.COMPLETED) {
      developer.log('ToolDAO - all() : API is responding : ${resp.message}');//\n\t Data : ${resp.data}\n\tMessage ${resp.message}');

      return jsonDecode(resp.data).map<Tool>((item) => Tool.fromJSON(item)).toList();
    }
    developer.log('ToolDAO - all() : Error, no data find on route GET /tool');
    return List.empty();
  }

  static Future<Tool?> find(int id) async{
    developer.log('ToolDAO - find($id)');

    final resp = await Api.get(
      route: '/tool/$id', token: true
    );

    if (resp.status == Status.COMPLETED) {
      developer.log('ToolDAO - find($id) : ${jsonDecode(resp.data)['number']}');
      Tool tool = Tool.fromJSON(jsonDecode(resp.data));
      developer.log('ToolDAO - find($id) : $tool');
      return tool;
    }

    developer.log('ToolDAO - find() : Error, no data find on route GET /tool');
    return null;
  }

  static Future<Tool?> findBySerialId(String serialId) async{
    developer.log('ToolDAO - findBySerialId($serialId)');

    final resp = await Api.get(
        route: '/tool/serialId/$serialId', token: true
    );

    if (resp.status == Status.COMPLETED) {
      developer.log('ToolDAO - findBySerialId($serialId) : ${jsonDecode(resp.data)['serialId']}');
      Tool tool = Tool.fromJSON(jsonDecode(resp.data));
      developer.log('ToolDAO - findBySerialId($serialId) : $tool');
      return tool;
    }

    developer.log('ToolDAO - findBySerialId() : Error, no data find on route GET /tool');
    return null;
  }
}