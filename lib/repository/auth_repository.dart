import 'package:epidemic_control_app/core/api/api.dart';
import 'package:epidemic_control_app/core/api/api_response.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/models/user_model.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class AuthRepository {
  ApiService api;

  AuthRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<User> login({@required login, @required password}) async {
    ApiResponse response = await api.request(
        method: Method.post,
        path: '/login',
        body: {'login': login, 'password': password});

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200)
      return User(
          name: login,
          id: response.body['id'],
          token: response.body['Authorization']);
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
