import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:http/http.dart';

class ApiResponse extends Equatable {
  int statusCode;
  dynamic body;
  Map headers;

  ApiResponse(Response response) {
    this.statusCode = response.statusCode;
    this.body = jsonDecode(response.body);
    this.headers = response.headers;
  }
}
