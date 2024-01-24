import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer' as developer;

import '../config/app_settings.dart';

class LandingView extends StatefulWidget {
  @override
  LandingViewState createState() => LandingViewState();
}

class LandingViewState extends State<LandingView> {

  @override
  void initState() {
    developer.log(('LandingViewState - initState()'));
    super.initState();

    Timer(const Duration(seconds:AppSettings.SPLASHSCREEN_DURATION),_runApp);
  }

  _runApp() {
    _routeFirstView();
  }

  void _routeFirstView() async {
    developer.log('LandingViewState - _routeFirstView()');

    SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setInt('userId', 0);

    int userId = (prefs.getInt('userId') ?? 0);
    if (userId == 0) {
      // User isn\'t connected yet -> /login
      developer.log('LandingViewState - _routeFirstView() : User wasn\'t connected yet');
      Navigator.pushNamedAndRemoveUntil(context, '/login', ModalRoute.withName('/login'));
    } else {
      // User is already connected -> /home
      developer.log('LandingViewState - _routeFirstView() : User $userId was already connected');
      Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/login'));
    }
  }

  @override
  Widget build(BuildContext context) {
    developer.log('LadingViewState - build()');

    final applicationName = Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Text('ToolKeeper', style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.lightGreen
        ))
    );

    final circularIndicator = Center(child: CircularProgressIndicator(color: Colors.white));
    return Scaffold(
        backgroundColor: Colors.lightGreen,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            applicationName,
            circularIndicator
          ],
        )
    );
  }
}