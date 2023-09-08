// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;
  Failure(this.errorMessage);
}

class ServierFailure extends Failure {
  ServierFailure(super.errorMessage);

  factory ServierFailure.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServierFailure('Connection timeout with ApiServier');

      case DioExceptionType.sendTimeout:
        return ServierFailure('Send timeout with ApiServier');

      case DioExceptionType.receiveTimeout:
        return ServierFailure('Recive timeout with ApiServier');

      case DioExceptionType.badCertificate:
        return ServierFailure('Bad Certificate with ApiServier');

      case DioExceptionType.badResponse:
        // return ServierFailure("errorMessage");
        return ServierFailure.fromResponse(
          dioException.response!.statusCode!,
          dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServierFailure('Reqest to ApiServer was canceld');

      case DioExceptionType.connectionError:
        return ServierFailure('Connection with ApiServier');

      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketExeption')) {
          return ServierFailure('No Internet Connection');
        }
        return ServierFailure('Unexpected Error , please try again');

      default:
        return ServierFailure('Opps There was an Error , please try again!');
    }
  }

  factory ServierFailure.fromResponse(
    int statusCode,
    dynamic response,
  ) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServierFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServierFailure("your request not found, pease try again");
    } else if (statusCode == 500) {
      return ServierFailure('Internal server error , please try again ');
    } else {
      return ServierFailure('opps there was an Error , please try again ');
    }
  }
}
