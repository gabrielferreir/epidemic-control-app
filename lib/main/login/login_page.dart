import 'package:epidemic_control_app/repository/auth_repository.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc loginBloc;
  var _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    this.loginBloc =
        LoginBloc(userService: UserService(), authRepository: AuthRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        key: _scaffoldKey,
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  top: 120.0, bottom: 32.0, left: 32.0, right: 32.0),
              child: Text('Epidemic Control App',
                  style: TextStyle(color: Colors.white70, fontSize: 28.0))),
          LoginContent(loginBloc: this.loginBloc)
        ])));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
