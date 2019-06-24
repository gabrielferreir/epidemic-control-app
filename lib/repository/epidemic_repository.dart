import 'package:epidemic_control_app/core/api/api.dart';
import 'package:epidemic_control_app/core/api/api_response.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:epidemic_control_app/models/user_model.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class EpidemicRepository {
  ApiService api;

  EpidemicRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<List<Epidemic>> readAll() async {
    print('readAll');
    ApiResponse response =
        await api.request(method: Method.get, path: '/api/epidemic');

    print(response.statusCode);
    print(response.body);

    List epidemics = response.body;

    if (response.statusCode == 200)
      return epidemics.map((item) => Epidemic.fromJSON(item)).toList();
    return throw UnknownException();
  }

  Future<bool> create({@required Epidemic epidemic}) async {
    ApiResponse response =
        await api.request(method: Method.post, path: '/api/epidemic', body: {
      'name': epidemic.name,
      'description': epidemic.description,
      'scientificName': epidemic.scientificName,
      'user': {'id': int.parse(epidemic.idUser)},
      'origen': epidemic.origen
    });

    if (response.statusCode == 200) return true;

    return throw UnknownException();
  }
}
