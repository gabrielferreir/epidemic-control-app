import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:epidemic_control_app/repository/cases_repository.dart';
import 'package:flutter/material.dart';
import 'maps.dart';

class MapsPage extends StatefulWidget {
  final Epidemic epidemic;

  MapsPage({@required this.epidemic});

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  MapsBloc mapsBloc;

  @override
  void initState() {
    this.mapsBloc = MapsBloc(casesRepository: CasesRepository());
    print('_MapsPageState ${widget.epidemic.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: <Widget>[
      MapsContent(mapsBloc: mapsBloc, idEpidemic: widget.epidemic.id),
      Container(
          height: 60.0,
          width: 60.0,
          child: AppBar(backgroundColor: Colors.transparent, elevation: 0.0))
    ])));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
