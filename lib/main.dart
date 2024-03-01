import 'package:flutter/material.dart';
import './app.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();
  App toolApplication = App();
  runApp(toolApplication.getStartUpView());
}
