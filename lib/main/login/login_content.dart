import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:epidemic_control_app/main/home/home_page.dart';
import 'package:epidemic_control_app/main/register_user/register_user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login.dart';

class LoginContent extends StatefulWidget {
  final LoginBloc loginBloc;

  LoginContent({@required this.loginBloc});

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  final _user = TextEditingController();
  final _pass = TextEditingController();
  bool passHidden = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: widget.loginBloc,
        listener: (BuildContext context, LoginState state) {
          print(state);
          if (state.stateAuth == StateAuth.logged) _goToHome();
          if (!state.loading) _showException(state.stateAuth);
        },
        child: BlocBuilder(
            bloc: widget.loginBloc,
            builder: (BuildContext context, LoginState state) {
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                      elevation: 8.0,
                      child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: TextFormField(
                                  controller: _user,
                                  decoration:
                                      InputDecoration(labelText: 'Usuário')),
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: TextFormField(
                                    controller: _pass,
                                    decoration: InputDecoration(
                                        labelText: 'Senha',
                                        suffixIcon: InkWell(
                                            child: !passHidden
                                                ? Icon(Icons.visibility,
                                                    color: Colors.black54)
                                                : Icon(Icons.visibility_off,
                                                    color: Colors.black54),
                                            onTap: () {
                                              setState(() {
                                                passHidden = !passHidden;
                                              });
                                            })),
                                    obscureText: passHidden)),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: SizedBox(
                                    height: 48.0,
                                    width: double.infinity,
                                    child: RaisedButton(
                                        elevation: 0.0,
                                        color: Theme.of(context).primaryColor,
                                        onPressed: _submit,
                                        child: state.loading
                                            ? Center(
                                                child: CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Colors.white)))
                                            : Text('ACESSAR O APLICATIVO',
                                                style: TextStyle(
                                                    color: Colors.white))))),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: GestureDetector(
                                  onTap: _goRegister,
                                  child: Text(
                                      'Ainda não possui cadastro? Clique aqui'),
                                ))
                          ]))));
            }));
  }

  _submit() async {
    final prefs = Preferences();
    widget.loginBloc.dispatch(ButtonPressed(
        prefs: prefs, username: _user.text, password: _pass.text));
  }

  _goToHome() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  _goRegister() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RegisterUserPage()));
  }

  _showException(StateAuth stateAuth) {
    switch (stateAuth) {
      case StateAuth.invalid:
        return _snackbar('Usuario e/ou senha invalidos');
      case StateAuth.network:
        return _snackbar('Verifique sua conexão com a internet');
      case StateAuth.unknown:
        return _snackbar('Tivemos um problema, tente novamente mais tarde');
      default:
    }
  }

  _snackbar(message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
