import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

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


    return Scaffold(
      appBar: AppBar(
        title: const Text('ToolKeeper - HomeView')
      ),
      body: Column(
        children: <Widget>[
          const Text('Home'),
        ]
      ),
      drawer: NavDrawableWidget()
    );
  }

}