import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class RegisterEpidemicState extends Equatable {
  final bool loading;
  final StateRegister stateRegister;

  RegisterEpidemicState({this.loading = false, this.stateRegister})
      : super([loading, stateRegister]);

  factory RegisterEpidemicState.initial() {
    return RegisterEpidemicState();
  }

  RegisterEpidemicState copyWith({bool loading, StateRegister stateRegister}) {
    return RegisterEpidemicState(
        loading: loading == null ? this.loading : loading,
        stateRegister: stateRegister ?? this.stateRegister);
  }
}

enum StateRegister { initial, created, invalid, unknown }
