import 'package:flutter/material.dart';
import 'register_case.dart';

class RegisterEpidemicPage extends StatefulWidget {
  @override
  _RegisterEpidemicPageState createState() => _RegisterEpidemicPageState();
}

class _RegisterEpidemicPageState extends State<RegisterEpidemicPage> {
  RegisterCaseBloc registerCaseBloc;

  @override
  void initState() {
    this.registerCaseBloc = RegisterCaseBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () {}, child: Icon(Icons.save)),
        body: RegisterCaseContent(registerCaseBloc: registerCaseBloc));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
