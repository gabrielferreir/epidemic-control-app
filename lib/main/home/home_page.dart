import 'package:epidemic_control_app/core/drawer/drawer.dart';
import 'package:epidemic_control_app/main/register_epidemic/register_epidemic_page.dart';
import 'package:epidemic_control_app/repository/epidemic_repository.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc;

  @override
  void initState() {
    this.homeBloc = HomeBloc(epidemicRepository: EpidemicRepository());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(userService: UserService()),
        floatingActionButton: FloatingActionButton(
            onPressed: _goRegister, child: Icon(Icons.add)),
        body: HomeContent(homeBloc: homeBloc));
  }

  @override
  void dispose() {
    super.dispose();
  }

  _goRegister() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegisterEpidemicPage()));
  }
}
