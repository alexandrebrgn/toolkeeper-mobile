import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:flutter/material.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import 'dart:developer' as developer;

import '../../config/app_settings.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    developer.log('HomeView - createState()');
    return HomeViewState();
  }

}

class HomeViewState extends State<StatefulWidget> {
  @override
  Widget build(BuildContext context) {
    developer.log('HomeViewState - build()');

    var text = 'Home';

    return Scaffold(
      appBar: AppSettings.appBarSettings(),
      body: Column(
        children: <Widget>[
          Text(text),
        ]
      ),
      drawer: NavDrawableWidget()
    );
  }

}