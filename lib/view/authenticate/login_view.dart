import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import '../../config/app_settings.dart';
import '../../view_model/login_view_model.dart';

class LoginView extends StatefulWidget{
    const LoginView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginViewState();
  }
}

class LoginViewState extends State<StatefulWidget> {

  TextEditingController _tecEmail = TextEditingController();
  TextEditingController _tecPassword = TextEditingController();

  // The viewmodel thais is used for data and commands biding
  late LoginViewModel _lvm;


  @override
  void initState() {
    developer.log('LoginViewState - initState()');

    // Debug
    _tecEmail.text = 'operator.1@toolkeeper.fr';
    _tecPassword.text = '12345678';
    _lvm=Provider.of<LoginViewModel>(context,listen:false);
  }

  @override
  Widget build(BuildContext context) {
    developer.log('LoginViewState - build()');

    final applicationName = Container(
      padding: const EdgeInsets.all(10),
      child: Text(AppSettings.APP_NAME, style: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.indigo.shade500)
      )
    );

    final space = Container(
      height: 10
    );

    final email = Container(
      padding : EdgeInsets.all(10),
      child : TextFormField(
        controller: _tecEmail,
        autofocus: true,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.grey),
          labelText: 'Email',
          border: OutlineInputBorder(),
        ),
      )
    );

    final password = Container(
        padding : EdgeInsets.all(10),
        child : TextFormField(
          controller : _tecPassword,
          autofocus: true,
          obscureText: true,
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.lock, color: Colors.grey),
            labelText: 'Mot de passe',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.orange),
            ),
          ),
        )
    );

    final infoText = Container(
      padding : EdgeInsets.all(10),
      child: Text('Connexion', style: TextStyle(
        fontSize: 25,
        color: Colors.grey,
      )),
    );

    final ButtonStyle submitStyle = ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(fontSize: 20),
    );

    final submit = Container(
        padding : EdgeInsets.all(10),
        height : 70,
        child : ElevatedButton(
            child: const Text('SE CONNECTER', style: TextStyle(color: Colors.white)),
            style: submitStyle,
            onPressed: () {
              Future<bool> isUserConnected = _lvm.signInButtonOnClickCommand(_tecEmail.text, _tecPassword.text);
              isUserConnected.then((value) {
                if (value) {
                  developer.log('Value : $value');
                  Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                }
              });
            }),
    );


    return Scaffold(
      body: SingleChildScrollView(
          child : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Application Name
            applicationName,
            infoText,
            Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child : SingleChildScrollView(
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    email,
                    password,
                    submit,
                  ],
                ),
              ),
            )
          ],
        )
      )
    );
  }
}