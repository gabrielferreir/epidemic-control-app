import 'package:epidemic_control_app/core/api/api.dart';
import 'package:epidemic_control_app/core/api/api_response.dart';
import 'package:epidemic_control_app/core/exceptions/exceptions.dart';
import 'package:epidemic_control_app/models/case_model.dart';
import 'package:epidemic_control_app/models/epidemic_model.dart';
import 'package:epidemic_control_app/models/user_model.dart';
import 'package:epidemic_control_app/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

class CasesRepository {
  ApiService api;

  CasesRepository() {
    api = ApiService(client: Client(), userService: UserService());
  }

  Future<List<Case>> readAll({@required idEpidemic}) async {
    ApiResponse response = await api.request(
        method: Method.get, path: '/api/case/getByEpidemicId/$idEpidemic');

    print(response.statusCode);
    print(response.body);

    List epidemics = response.body;

    print(epidemics);

    if (response.statusCode == 200)
      return epidemics.map((item) => Case.fromJSON(item)).toList();
    return throw UnknownException();
  }

  Future<bool> create({@required Case epidemicCase}) async {
    final String date = epidemicCase.date.substring(0, 10);
    ApiResponse response =
        await api.request(method: Method.post, path: '/api/case', body: {
      'dateReg': date,
      'epidemic': {'id': epidemicCase.idEpidemic},
      'latitude': epidemicCase.latitude,
      'longitude': epidemicCase.longitude
    });

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) return true;

    return throw UnknownException();
  }
}
