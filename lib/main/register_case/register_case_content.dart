import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'register_case.dart';

class RegisterCaseContent extends StatefulWidget {
  final RegisterCaseBloc registerCaseBloc;

  RegisterCaseContent({@required this.registerCaseBloc});

  @override
  _RegisterCaseContentState createState() =>
      _RegisterCaseContentState();
}

class _RegisterCaseContentState extends State<RegisterCaseContent> {
  final _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.registerCaseBloc,
        builder: (BuildContext context, RegisterCaseState state) {
          return NestedScrollView(
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
                                color: Colors.white,
                                fontSize: 16.0,
                              ))))
                ];
              },
              body: ListView(padding: EdgeInsets.all(16.0), children: <Widget>[
                input(label: 'Data registro', controller: _name),
                input(label: 'Quantidade', controller: _name),
                input(label: 'Pais de origem', controller: _name),
                input(label: 'Sintomas', controller: _name),
                input(label: 'Agente', controller: _name),
                input(label: 'Nome ciêntifico', controller: _name),
                input(label: 'Relator', controller: _name)
              ]));
        });
  }

  Widget input(
      {@required TextEditingController controller, @required String label}) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: TextFormField(
            controller: controller,
            decoration: InputDecoration(labelText: label)));
  }
}
