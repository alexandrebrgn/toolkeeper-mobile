import 'package:campus/view/component/nav_drawable_widget.dart';
import 'package:campus/config/app_settings.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;


class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    developer.log('Settings - createState()');
    return SettingsState();
  }
}

class SettingsState extends State<StatefulWidget> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    developer.log('SettingsState - build()');
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar : AppSettings.appBarSettings(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Switch(
                value: isDarkMode,
                onChanged: (isOn) {
                  developer.log('Bouton Changé');
                  isOn ? _toggleTheme(ThemeMode.dark) : _toggleTheme(ThemeMode.light);
                  if (!isOn) {
                    developer.log('non');
                  } else {
                    developer.log('oui');
                  }
                },
              ),
            ],
          )
        ],
      )
    );
  }
}