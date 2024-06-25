import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cubtale/basic_structure/failure/login/login_repository_failure.dart';
import 'package:cubtale/basic_structure/repository/login/i_login_repository.dart';
import 'package:cubtale/core/common/api_header.dart';
import 'package:cubtale/core/model/user/user_model.dart';
import 'package:cubtale/service/decode_response_body.dart';
import 'package:cubtale/service/http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository(this._client);
  final Client _client;
  @override
  Future<Either<LoginRepositoryFailure, UserModel>> login({
    required String email,
    required String password,
    required ApiHeader Function() apiHeaderCallback,
  }) async {
    try {
      final apiHeader = apiHeaderCallback();
      final uri = Uri(
        scheme: 'https',
        host: HttpService.host,
        path: 'default/AdminPanelLogin',
      );

      final jsonData = {
        "username": email,
        "password": password,
      };

      final response = await _client.post(
        uri,
        body: jsonEncode(jsonData),
        headers: apiHeader.jsonHeaderMap,
      );

      final result = decodeResponseBody(response.bodyBytes);
      final generalFailure = _handleGeneralErrors(response.statusCode, result);

      if (generalFailure != null) return left(generalFailure);

      return right(UserModel.fromMap(result));
    } on SocketException catch (_) {
      return left(const LoginRepositoryConnectionFailure());
    } catch (e) {
      log(e.toString());
      return left(LoginRepositoryUnknownFailure(e.toString()));
    }
  }

  LoginRepositoryFailure? _handleGeneralErrors(
      int statusCode, Map<String, dynamic> result) {
    final errorMap = result['error_msg'] as String?;
    if (errorMap != null) {
      return LoginRepositoryUnknownFailure(errorMap);
    }
    if (statusCode == 200) return null;

    if (statusCode == 404) {
      return const LoginRepositoryNotFoundFailure();
    } else if (statusCode == 500) {
      return const LoginRepositoryInternalFailure();
    } else {
      return LoginRepositoryUnknownFailure("Error code: $statusCode");
    }
  }
}
