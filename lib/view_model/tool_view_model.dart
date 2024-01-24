import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../model/tool.dart';
import '../model/tool_dao.dart';

class ToolViewModel extends ChangeNotifier{

  late Future<List<Tool>> tools;

  ToolViewModel() {
    developer.log('ToolViewModel - ToolViewModel()');
    tools=ToolDAO.all();
  }
}