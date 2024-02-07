import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;

import '../model/operation.dart';
import '../model/operation_dao.dart';

class OperationViewModel extends ChangeNotifier {
  late Future<List<Operation>> operations;
  OperationViewModel();

  Future<void> initBrowOperations() {
    developer.log('OperationViewModel - browOperations()');
    return operations = OperationDAO.all();
  }
}