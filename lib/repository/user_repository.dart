import 'package:epidemic_control_app/core/api/api.dart';
import 'package:epidemic_control_app/core/api/api_response.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/models/user_model.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class UserRepository {
  ApiService api;

  UserRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<User> register(
      {@required name, @required login, @required password}) async {
    ApiResponse response =
        await api.request(method: Method.post, path: '/api/user', body: {
      'name': name,
      'login': login,
      'password': password,
      'perfis': ['ADMIN'],
//      'cpf': '10641091010'
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200)
      return User(
          id: response.body['id'] != null
              ? response.body['id'].toString()
              : null,
          token: response.body['Authorization'],
          name: name);
    if (response.statusCode == 401) return throw BadRequestException();
    return throw UnknownException();
  }
}
