class UnknownException implements Exception {
  final String message;

  const UnknownException([this.message = '']);

  String toString() => this.message;
}

//class NotFoundException implements Exception {
//  final String message;
//
//  const NotFoundException([this.message = '']);
//
//  String toString() => this.message;
//}

//class ConflictException implements Exception {
//  final String message;
//
//  const ConflictException([this.message = '']);
//
//  String toString() => this.message;
//}

class BadRequestException implements Exception {
  final String message;

  const BadRequestException([this.message = '']);

//  String toString() => this.message;
}

//class WithoutInternetException implements Exception {
//  final String message;
//
//  const WithoutInternetException([this.message = '']);
//
//  String toString() => this.message;
//}

//class UnauthorizedException implements Exception {
//  final String message;
//
//  const UnauthorizedException([this.message = '']);
//
//  String toString() => this.message;
//}

enum TypeException {
  None,
  UnknownException,
  NotFoundException,
  ConflictException,
  BadRequestException,
  WithoutInternetException,
  UnauthorizedException
}
