import 'package:epidemic_control_app/main/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_user.dart';

class RegisterUserContent extends StatefulWidget {
  final RegisterUserBloc registerUserBloc;
  final TextEditingController name;
  final TextEditingController login;
  final TextEditingController pass;

  RegisterUserContent(
      {@required this.registerUserBloc,
      @required this.name,
      @required this.login,
      @required this.pass});

  @override
  _RegisterUserContentState createState() => _RegisterUserContentState();
}

class _RegisterUserContentState extends State<RegisterUserContent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: widget.registerUserBloc,
        listener: (context, RegisterUserState state) {
          if (!state.loading) {
            _showExceptions(state.stateRegister);
            if (state.stateRegister == StateRegister.registered) _goToLogin();
          }
        },
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                        centerTitle: true,
                        title: Text("Faça seu cadastro",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ))))
              ];
            },
            body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
              input(label: 'Nome', controller: widget.name),
              input(label: 'Login', controller: widget.login),
              input(label: 'Senha', controller: widget.pass)
            ])));
  }

  Widget input(
      {@required TextEditingController controller, @required String label}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label)));
  }

  void _showExceptions(StateRegister stateRegister) {
    if (stateRegister == StateRegister.invalid)
      _showSnackbar('Esse login já foi utilizado');
    if (stateRegister == StateRegister.unknown)
      _showSnackbar('Tivemos um problema tente novamente mais tarde');
  }

  void _showSnackbar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToLogin() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
        ModalRoute.withName('/root'));
  }
}
