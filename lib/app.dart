import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Views
import 'view/landing_view.dart';
import 'view/authenticate/login_view.dart';
import 'view/home/home_view.dart';

// ViewModels
import 'view_model/login_view_model.dart';
import 'package:campus/view_model/tool_view_model.dart';

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
      },
    );
  }

  MaterialApp getStartUpView(){
    return _startUpView;
  }
}