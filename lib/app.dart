import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Views
import 'view/landing_view.dart';
import 'view/authenticate/login_view.dart';
import 'view/home/home_view.dart';
import 'view/tool/tool_view.dart';

// ViewModels
import 'view_model/login_view_model.dart';
import 'view_model/home_view_model.dart';
import 'view_model/tool_view_model.dart';

class App{
  late MaterialApp _startUpView;

  App() {
    _startUpView = MaterialApp(
      title:"ToolKeeper",
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/': (context) => LandingView(),
        '/login': (context) => ChangeNotifierProvider(create: (context) => LoginViewModel(), child: const LoginView()),
        '/home': (context) => ChangeNotifierProvider(create: (context) => HomeViewModel(), child: const HomeView()),
        '/tool': (context) => ChangeNotifierProvider(create: (context) => ToolViewModel(), child: const ToolView()),
      },
    );
  }

  MaterialApp getStartUpView(){
    return _startUpView;
  }
}