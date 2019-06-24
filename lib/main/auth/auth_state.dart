import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class AuthState extends Equatable {
  final StateAuth stateAuth;

  AuthState({this.stateAuth = StateAuth.loading}) : super([stateAuth]);

  AuthState copyWith({StateAuth stateAuth}) {
    return AuthState(stateAuth: stateAuth ?? this.stateAuth);
  }
}

enum StateAuth { loading, initial, logged }
