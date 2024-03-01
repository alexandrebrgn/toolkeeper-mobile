import 'dart:ui';
import 'dart:developer' as developer;
import 'package:intl/date_time_patterns.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

import '../view/component/scan_widget.dart';

class AppSettings {
  static const int SPLASHSCREEN_DURATION = 1;
  static const String APP_NAME = 'ToolKeeper';
  static const String APP_LOGO_URI = 'ToolKeeper';

  static const String API_URI = '172.21.5.12';
  static const int API_PORT = 8080;
  static const String API_PATH = 'api';
  static const String API_VERSION = 'v1';

  static frenchFormat(date, separator) {
    initializeDateFormatting();
    if (date != '' && date != null) {
      var frenchDateFormat;
      if (separator != '') {
        frenchDateFormat = DateFormat('dd $separator MM $separator yyyy');
      } else {
        frenchDateFormat = DateFormat('dd/MM/yyyy');
      }
      return frenchDateFormat.format(DateTime.parse(date));
    }
    return date;
  }

  static appBarSettings([bool? displayScan]) {
    return AppBar(
      title: const Text(APP_NAME),
      titleTextStyle: const TextStyle(
          fontSize: 35, fontWeight: FontWeight.bold, color: Colors.indigo),
      centerTitle: true,
      actions: const [
          ScanWidget(),
      ],
    );
  }

  static iconOfCategory(name) {
    if (name == "Extincteur") {
      return const Icon(Icons.fire_extinguisher);
    }
    if (name == "Climatiseur") {
      return const Icon(Icons.air);
    }
    if (name == "Véhicule") {
      return const Icon(Icons.directions_car);
    }
  }
}
