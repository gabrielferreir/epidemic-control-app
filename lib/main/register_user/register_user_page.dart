import 'package:epidemic_control_app/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_user.dart';

class RegisterUserPage extends StatefulWidget {
  @override
  _RegisterUserPageState createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  RegisterUserBloc registerUserBloc;
  final name = TextEditingController();
  final login = TextEditingController();
  final pass = TextEditingController();

  @override
  void initState() {
    this.registerUserBloc = RegisterUserBloc(userRepository: UserRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: registerUserBloc,
      builder: (context, RegisterUserState state) {
        return Scaffold(
            floatingActionButton: FloatingActionButton(
                onPressed: !state.loading ? _submit : null,
                child: state.loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    : Icon(Icons.save)),
            body: RegisterUserContent(
                registerUserBloc: registerUserBloc,
                name: name,
                pass: pass,
                login: login));
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  _submit() {
    registerUserBloc.dispatch(
        Register(name: name.text, login: login.text, password: pass.text));
  }
}
