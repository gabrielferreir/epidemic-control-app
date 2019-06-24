import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class AuthEvent extends Equatable {
  AuthEvent([List props = const []]) : super(props);
}

class Started extends AuthEvent {
  Preferences prefs;

  Started({@required this.prefs});
}
