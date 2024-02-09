import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import '../model/operation.dart';
import '../model/operation_dao.dart';

class OperationViewModel extends ChangeNotifier {
  late Future<List<Operation>> operations;
  late Future<Operation?> selectedOperation;

  OperationViewModel();

  Future<void> initBrowOperations() {
    developer.log('OperationViewModel - browOperations()');
    return operations = OperationDAO.all();
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
      notifyListeners();
      return true;
    }
    developer.log('OperationViewModel - initReadOperation() : failed!');
    return false;
  }
}