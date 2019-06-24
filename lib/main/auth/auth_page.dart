import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';

import 'auth.dart';

class AuthPage extends StatefulWidget {
  Preferences prefs;

  AuthPage({@required this.prefs});

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthBloc authBloc;

  @override
  void initState() {
    this.authBloc = AuthBloc(userService: UserService());
    _started();
    super.initState();
  }

  _started() async {
    authBloc.dispatch(Started(prefs: widget.prefs));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthContent(authBloc: authBloc, prefs: Preferences()));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
