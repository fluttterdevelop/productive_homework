import 'package:productive/core/exception/exception.dart';

import '../models/authenticated_user.dart';

abstract class AuthenticationRemoteDataSource {
  factory AuthenticationRemoteDataSource() =>
      _AuthenticationRemoteDataSourceImpl();
  Future<AuthenticatedUserModel> getUser(String username, String password);
}

class _AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final dio = Dio();
  @override
  Future<AuthenticatedUserModel> getUser(
      String username, String password) async {
    try {
      final response = await dio.post('/auth/login', data: {
        'username': username,
        'password': password,
      });

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return const AuthenticatedUserModel();
      } else {
        throw ServerException();
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException();
    }
  }
}

class Dio {
  post(String s, {required Map<String, String> data}) {}
}