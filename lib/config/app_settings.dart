import 'dart:ui';
import 'dart:developer' as developer;
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';

class AppSettings {
  static const int SPLASHSCREEN_DURATION = 1;
  static const String APP_NAME = 'ToolKeeper';
  static const String APP_LOGO_URI = 'ToolKeeper';

  static const String API_URI ='172.21.5.11';
  static const int API_PORT = 8080;
  static const String API_PATH ='api';
  static const String API_VERSION ='v1';


  static frenchFormat(date, separator) {
    var frenchDateFormat;
    if (separator != '') {
      frenchDateFormat = DateFormat('dd $separator MM $separator yyyy');
    } else {
      frenchDateFormat = DateFormat('dd/MM/yyyy');
    }
    return frenchDateFormat.format(DateTime.parse(date));
  }

  static appBarSettings() {
    return AppBar(
      title: const Text(APP_NAME),
      titleTextStyle: const TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.bold,
        color: Colors.indigo
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.nfc),
          onPressed : () => {
            developer.log('NFC Icon pressed')
          },
            )
      ],
    );
  }

  static iconOfCategory(name) {
    if(name=="Extincteurs") {
      return const Icon(Icons.fire_extinguisher);
    }
    if(name=="Climatiseurs") {
      return const Icon(Icons.air);
    }
    if(name=="Véhicules") {
      return const Icon(Icons.directions_car);
    }
  }
}