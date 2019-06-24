import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class ButtonPressed extends LoginEvent {
  Preferences prefs;
  String username;
  String password;

  ButtonPressed({@required this.prefs, @required this.username, @required this.password});
}

class HideSnackbar extends LoginEvent {}
