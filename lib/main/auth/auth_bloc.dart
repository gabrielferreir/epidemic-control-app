import 'package:bloc/bloc.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:meta/meta.dart';

import 'auth.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserService userService;

  AuthBloc({@required this.userService});

  @override
  AuthState get initialState => AuthState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is Started) {
      final user = await this.userService.read(prefs: event.prefs);
      userService.user = user;
      if (user == null)
        yield currentState.copyWith(stateAuth: StateAuth.initial);
      else
        yield currentState.copyWith(stateAuth: StateAuth.logged);
    }
  }
}
