import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:epidemic_control_app/main/login/login.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final UserService userService;

  MyDrawer({@required this.userService});

  logout(context) async {
    await userService.logout(prefs: Preferences());
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(children: <Widget>[
      UserAccountsDrawerHeader(
          accountName: Text(userService?.user?.name ?? ''),
          accountEmail: Text('Epidemic Control'),
          currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(userService?.user?.name != null
                  ? userService?.user?.name[0].toUpperCase()
                  : ''))),
      Expanded(child: ListView(padding: EdgeInsets.all(0), children: <Widget>[])),
      Container(
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                  child: Column(children: <Widget>[
                Divider(),
                ListTile(
                    title: Text('Sair'),
                    trailing: Text('1.0.0'),
                    onTap: () {
                      logout(context);
                    })
              ]))))
    ]));
  }
}
