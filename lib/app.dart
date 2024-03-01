import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './config/app_themes.dart';

// Views
import 'view/landing_view.dart';
import 'view/authenticate/login_view.dart';
import 'view/home/home_view.dart';
import 'view/tool/tool_view.dart';
import 'view/operation/operation_browse_view.dart';
import 'view/profile/profile_view.dart';
import 'view/scan/scan_view.dart';
import 'view/settings/settings.dart';

// ViewModels
import 'view_model/login_view_model.dart';
import 'view_model/home_view_model.dart';
import 'view_model/tool_view_model.dart';
import 'view_model/operation_view_model.dart';
import 'view_model/profile_view_model.dart';
import 'view_model/scan_view_model.dart';

class App{
  late MaterialApp _startUpView;

  App() {
    _startUpView = MaterialApp(
      title:"ToolKeeper",
      theme: MyAppThemes.lightTheme,
      darkTheme: MyAppThemes.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/': (context) => LandingView(),
        '/login': (context) => ChangeNotifierProvider(create: (context) => LoginViewModel(), child: const LoginView()),
        '/home': (context) => ChangeNotifierProvider(create: (context) => HomeViewModel(), child: const HomeView()),
        '/profile': (context) => ChangeNotifierProvider(create: (context) => ProfileViewModel(), child: const ProfileView()),
        '/tool': (context) => ChangeNotifierProvider(create: (context) => ToolViewModel(), child: const ToolView()),
        '/operation': (context) => ChangeNotifierProvider(create: (context) => OperationViewModel(), child: const OperationBrowseView()),
        '/scan': (context) => ChangeNotifierProvider(create: (context) => ScanViewModel(), child: const ScanView()),
        '/settings': (context) => const Settings(),
      },
    );
  }

  MaterialApp getStartUpView(){
    return _startUpView;
  }
}