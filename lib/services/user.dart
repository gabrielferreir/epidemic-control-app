import 'package:epidemic_control_app/core/prefs/preferences.dart';
import 'package:epidemic_control_app/models/user_model.dart';
import 'package:meta/meta.dart';

class UserService {
  static User _user;

  User get user {
    return _user;
  }

  set user(usr) {
    _user = usr;
  }

  String get token => this.user?.token;

  Future<void> logout({@required Preferences prefs}) async {
    final _prefs = await prefs.instance();
    await _prefs.remove('id');
    await _prefs.remove('token');
    await _prefs.remove('name');
  }

  Future<void> save({
    @required Preferences prefs,
    @required String id,
    @required String token,
    @required String name,
  }) async {
    final _prefs = await prefs.instance();
    await _prefs.setString('id', id);
    await _prefs.setString('token', token);
    await _prefs.setString('name', name);
  }

  Future<User> read({@required Preferences prefs}) async {
    final _prefs = await prefs.instance();
    final id = _prefs.getString('id');
    final token = _prefs.getString('token');
    final name = _prefs.getString('name');
    if (token == null) return null;
    return User(name: name, token: token, id: id);
  }
}
