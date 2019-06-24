import 'package:epidemic_control_app/repository/epidemic_repository.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_epidemic.dart';

class RegisterEpidemicPage extends StatefulWidget {
  @override
  _RegisterEpidemicPageState createState() => _RegisterEpidemicPageState();
}

class _RegisterEpidemicPageState extends State<RegisterEpidemicPage> {
  RegisterEpidemicBloc registerEpidemicBloc;
  UserService userService;

  final name = TextEditingController();
  final scientificName = TextEditingController();
  final description = TextEditingController();
  final origin = TextEditingController();

  @override
  void initState() {
    this.registerEpidemicBloc = RegisterEpidemicBloc(
        epidemicRepository: EpidemicRepository(), userService: UserService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: registerEpidemicBloc,
        builder: (BuildContext context, RegisterEpidemicState state) {
          return Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: !state.loading ? _submit : null,
                child: state.loading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white))
                    : Icon(Icons.save),
              ),
              body: RegisterEpidemicContent(
                  name: name,
                  scientificName: scientificName,
                  description: description,
                  origin: origin,
                  registerEpidemicBloc: registerEpidemicBloc));
        });
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submit() {
    print('_submit');
    registerEpidemicBloc.dispatch(Register(
        name: name.text,
        scientificName: scientificName.text,
        description: description.text,
        origin: origin.text));
  }
}
