import 'package:epidemic_control_app/main/maps/maps_page.dart';
import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

class HomeContent extends StatefulWidget {
  final HomeBloc homeBloc;

  HomeContent({@required this.homeBloc});

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  void initState() {
    widget.homeBloc.dispatch(Started());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: widget.homeBloc,
        builder: (BuildContext context, HomeState state) {
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
                          title: Text("Epidemias",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0))))
                ];
              },
              body: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                      state.list.length,
                      (index) => Center(
                          child: GestureDetector(
                              onTap: () => _goMap(epidemic: state.list[index]),
                              child: Column(children: <Widget>[
                                CircleAvatar(
                                  radius: 32,
                                  child: Text(
                                      state.list[index].name[0].toUpperCase()),
                                ),
                                Padding(padding: EdgeInsets.only(top: 8)),
                                Text(state.list[index].name)
                              ]))))));
        });
  }

  _goMap({@required Epidemic epidemic}) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => MapsPage(epidemic: epidemic)));
  }
}
