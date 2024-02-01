import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../model/tool.dart';
import '../model/tool_dao.dart';

class ToolViewModel extends ChangeNotifier{

  late Future<List<Tool>> tools;
  late Future<Tool?> selectedTool;

  ToolViewModel() {
    developer.log('ToolViewModel - ToolViewModel()');
    tools=ToolDAO.all();
  }

  Future<void> browTools() {
    developer.log('ToolViewModel - browTools()');
    return tools = ToolDAO.all();
  }

  Future<void> initBrowTools() {
    developer.log('ToolViewModel - browTools()');
    return tools = ToolDAO.all();
  }

  Future<bool> readTool(int toolId) async {
    developer.log('ToolViewModel - readTool($toolId)');
    selectedTool = ToolDAO.find(toolId);
    if (selectedTool!=null) {
      developer.log('ToolViewModel - ReadTool() : success $selectedTool');
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> initReadTool(int toolId) async {
    developer.log('ToolViewModel - initReadTool($toolId)');
    selectedTool = ToolDAO.find(toolId);
    if (selectedTool!=null) {
      developer.log('ToolViewModel - initReadTool() : success $selectedTool');
      return true;
    }
    return false;
  }
}