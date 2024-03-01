import 'dart:convert';
import 'package:campus/model/api_response.dart';

import './operation.dart';
import 'dart:developer' as developer;

import 'api.dart';

class OperationDAO {
  static Future<List<Operation>> all() async{
    developer.log('OperationDAO - all()');

    final resp = await Api.get(route: '/operation', urlParams: null, token: true);

    if (resp.status == Status.COMPLETED) {
      developer.log('OperationDAO - all() : API is responding :\n\t Data : ${resp.data}\n\tMessage ${resp.message}');

      return jsonDecode(resp.data).map<Operation>((item) => Operation.fromJSON(item)).toList();
    }
    developer.log('OperationDAO - all() : Error, no data find on route GET /operation');
    return List.empty();
  }

  static Future<List<Operation>> getFutureOperations() async{
    developer.log('OperationDAO - getFutureOperations()');

    final resp = await Api.get(route: '/operation', urlParams: null, token: true);

    if (resp.status == Status.COMPLETED) {
      developer.log('OperationDAO - getFutureOperations() : API is responding :\n\t Data : ${resp.data}\n\tMessage ${resp.message}');

      return jsonDecode(resp.data).map<Operation>((item) => Operation.fromJSON(item)).toList();
    }
    developer.log('OperationDAO - getFutureOperations() : Error, no data find on route GET /operation');
    return List.empty();
  }

  static Future<Operation?> find(int id) async{
    developer.log('OperationDAO - find($id)');

    final resp = await Api.get(
        route: '/operation/$id', token: true
    );

    if (resp.status == Status.COMPLETED) {
      developer.log('OperationDAO - find($id) : ${jsonDecode(resp.data)['toDoDate']}');
      Operation operation = Operation.fromJSON(jsonDecode(resp.data));
      developer.log('OperationDAO - find($id) : $operation');
      return operation;
    }

    developer.log('OperationDAO - find() : Error, no data find on route GET /operation');
    return null;
  }

  static Future<Operation?> edit({Map<String, String>? params}) async{
    developer.log('OperationDAO - edit(${params!['id']})');

    final resp = await Api.put(
        route: '/operation/${params!['id']}', bodyParams: params, token: true
    );

    if (resp.status == Status.COMPLETED) {
      return Operation.fromJSON(jsonDecode(resp.data));
    }

    developer.log('OperationDAO - find() : Error, no data find on route GET /operation');
    return null;
  }
}