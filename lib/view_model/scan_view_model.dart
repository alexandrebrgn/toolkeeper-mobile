import 'package:flutter/cupertino.dart';
import 'dart:developer' as developer;
import '../model/tool.dart';
import '../model/tool_dao.dart';

class ScanViewModel extends ChangeNotifier {

  late Future<Tool?> scannedTool;

  ScanViewModel();

  Future<Tool?> barCodeToolReader(String toolBarCodeId) async {
    developer.log('ScanViewModel - barCodeToolReader($toolBarCodeId)');

    scannedTool = ToolDAO.findBySerialId(toolBarCodeId);

    if (scannedTool != null) {
      developer.log('ScanViewModel - barCodeToolReader() : success $scannedTool');
      notifyListeners();
      return scannedTool;
    }
    return scannedTool;
  }
}