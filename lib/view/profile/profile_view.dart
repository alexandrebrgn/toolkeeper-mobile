import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import '../../config/app_settings.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    developer.log('ProfileView - createState()');
    return ProfileViewState();
  }

}

class ProfileViewState extends State<StatefulWidget> {


  @override
  Widget build(BuildContext context) {
    developer.log('ProfileViewState - build()');


    return Scaffold(
        appBar: AppSettings.appBarSettings(),
        body: Column(
            children: <Widget>[
              const Text('Profile'),
            ]
        ),
        drawer: NavDrawableWidget()
    );
  }

}