import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class RegisterUserEvent extends Equatable {
  RegisterUserEvent([List props = const []]) : super(props);
}

class Register extends RegisterUserEvent {
  String name;
  String login;
  String password;

  Register(
      {@required this.name, @required this.login, @required this.password});
}
