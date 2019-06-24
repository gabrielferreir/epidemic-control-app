import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class LoginState extends Equatable {
  final bool loading;
  final StateAuth stateAuth;

  LoginState({this.loading = false, this.stateAuth = StateAuth.initial})
      : super([loading, stateAuth]);

  LoginState copyWith({bool loading, StateAuth stateAuth}) {
    return LoginState(
        loading: loading == null ? this.loading : loading, stateAuth: stateAuth ?? this.stateAuth);
  }
}

enum StateAuth { initial, logged, invalid, network, unknown }
