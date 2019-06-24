import 'package:epidemic_control_app/main/home/home_page.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_epidemic.dart';

class RegisterEpidemicContent extends StatefulWidget {
  final RegisterEpidemicBloc registerEpidemicBloc;

  final TextEditingController name;
  final TextEditingController scientificName;
  final TextEditingController description;
  final TextEditingController origin;

  RegisterEpidemicContent(
      {@required this.registerEpidemicBloc,
      @required this.name,
      @required this.scientificName,
      @required this.description,
      @required this.origin});

  @override
  _RegisterEpidemicContentState createState() =>
      _RegisterEpidemicContentState();
}

class _RegisterEpidemicContentState extends State<RegisterEpidemicContent> {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
        bloc: widget.registerEpidemicBloc,
        listener: (BuildContext context, RegisterEpidemicState state) {
          _showExceptions(state.stateRegister);
          if (state.stateRegister == StateRegister.created) _goToHome();
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
                        title: Text("Cadastrar Epidemia",
                            style: TextStyle(
                                color: Colors.white, fontSize: 16.0))))
              ];
            },
            body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
              input(label: 'Nome', controller: widget.name),
              input(
                  label: 'Nome cientifico', controller: widget.scientificName),
              input(label: 'Descrição', controller: widget.description),
              input(label: 'Pais de origem', controller: widget.origin),
//                input(label: 'Sintomas', controller: widget),
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
    if (stateRegister == StateRegister.unknown)
      _showSnackbar('Tivemos um problema tente novamente mais tarde');
  }

  void _showSnackbar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  void _goToHome() {
    Navigator.pop(context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (conetext) => HomePage()));
  }
}
