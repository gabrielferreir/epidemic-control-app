import 'dart:async';
import 'dart:convert';

import 'package:epidemic_control_app/services/user.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import 'api_response.dart';
import 'headers.dart';

const URL = 'http://52.15.161.238:8080';

class ApiService {
  Client client;
  UserService userService;
  String url;

  ApiService({this.client, this.userService, this.url = URL});

  Future<ApiResponse> request(
      {@required Method method,
      @required String path,
      Map<String, dynamic> body,
      Map<String, dynamic> headers}) async {
    try {
      String fullPath = '$url$path';

      Map<String, dynamic> fullHeaders =
          Headers(token: userService.token, json: headers).json;

      Response response = await _callMethod(
          method: method, path: fullPath, body: body, headers: fullHeaders);

      return ApiResponse(response);
    } catch (err) {
      return throw err;
    }
  }

  Future<Response> _callMethod(
      {@required Method method,
      @required String path,
      Map<String, dynamic> body,
      headers}) async {
    print(path);
    print(body);
    print(headers);
    switch (method) {
      case Method.get:
        return await _get(path, headers);
      case Method.post:
        return await _post(path, body, headers);
      case Method.put:
        return await _put(path, body, headers);
      case Method.delete:
        return await _delete(path, headers);
      default:
        throw Exception('Invalid method');
    }
  }

  Future<Response> _get(String url, Map headers) async {
    return await client.get(url, headers: Map.from(headers));
  }

  Future<Response> _post(url, body, headers) async {
    return await client.post(url, body: jsonEncode(body), headers: headers);
  }

  Future<Response> _put(String url, body, Map headers) async {
    return await client.put(url, body: jsonEncode(body), headers: headers);
  }

  Future<Response> _delete(String url, Map headers) async {
    return await client.delete(url, headers: headers);
  }
}

enum Method { get, post, put, delete }
