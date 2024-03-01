import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import '../model/operation.dart';
import '../model/operation_dao.dart';

class OperationViewModel extends ChangeNotifier {
  late Future<List<Operation>> operations;
  late Future<Operation?> selectedOperation;

  OperationViewModel();

  Future<void> initBrowOperations() {
    developer.log('OperationViewModel - initBrowOperations()');
    return operations = OperationDAO.all();
  }

  Future<void> browOperations() async {
    developer.log('OperationViewModel - browOperations()');
    List<Operation?> refreshOperations = await OperationDAO.all();
    if (refreshOperations != null) {
      final newOperations = await operations;
      newOperations.clear();
      for(var i = 1; i <= refreshOperations.length - 1; i++) {
        newOperations.add(refreshOperations[i]!);
        developer.log('${refreshOperations[i]}');
      }
      notifyListeners();
    }
    developer.log('OperationViewModel - browOperations() - end');
  }

  Future<bool> editOperation(Map<String, String>? operationParams) async {
    developer.log('OperationViewModel - editOperation($operationParams)');
    Operation? operation = await OperationDAO.edit(params: operationParams);
    if (operation != null) {
      final refreshOperations = await operations;

      final _operation = refreshOperations.firstWhere((Operation item) => item.id == operation.id);
      final index = refreshOperations.lastIndexOf(_operation);
      notifyListeners();
      developer.log('OperationViewModel - editOperation() : operations -> $refreshOperations !');
      return true;
    }
    developer.log('OperationViewModel - editOperation() : failed !');
    return false;
  }

  Future<bool> readOperation(int toolId) async {
    developer.log('OperationViewModel - readOperation($toolId)');
    selectedOperation = OperationDAO.find(toolId);
    if (selectedOperation!=null) {
      developer.log('OperationViewModel - ReadOperation() : success $selectedOperation');
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> initReadOperation(int toolId) async {
    developer.log('OperationViewModel - initReadOperation($toolId)');
    selectedOperation = OperationDAO.find(toolId);
    if (selectedOperation!=null) {
      developer.log('OperationViewModel - initReadOperation() : success $selectedOperation');
      return true;
    }
    developer.log('OperationViewModel - initReadOperation() : failed!');
    return false;
  }

}