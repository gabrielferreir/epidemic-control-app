import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RegisterUserState extends Equatable {
  final bool loading;
  final StateRegister stateRegister;

  RegisterUserState({this.loading = false, this.stateRegister})
      : super([loading, stateRegister]);

  factory RegisterUserState.initial() {
    return RegisterUserState();
  }

  RegisterUserState copyWith({bool loading, StateRegister stateRegister}) {
    return RegisterUserState(
        loading: loading == null ? this.loading : loading,
        stateRegister: stateRegister ?? this.stateRegister);
  }
}

enum StateRegister { initial, registered, invalid, unknown }
