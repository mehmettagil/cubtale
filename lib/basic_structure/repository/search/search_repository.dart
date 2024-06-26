import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cubtale/basic_structure/failure/search/login_repository_failure.dart';
import 'package:cubtale/basic_structure/repository/search/i_search_repository.dart';
import 'package:cubtale/core/common/api_header.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:cubtale/service/decode_response_body.dart';
import 'package:cubtale/service/http_service.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

class SearchRepository implements ISearchRepository {
  SearchRepository(this._client);
  final Client _client;
  @override
  @override
  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> searchEmail({
    required String email,
    required ApiHeader Function() apiHeaderCallback,
  }) {
    return _search(
      body: {'email': email},
      apiHeaderCallback: apiHeaderCallback,
    );
  }

  @override
  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> searchId({
    required String accId,
    required ApiHeader Function() apiHeaderCallback,
  }) {
    return _search(
      body: {'acc_id': accId},
      apiHeaderCallback: apiHeaderCallback,
    );
  }

  @override
  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> searchDate({
    required String accCreationDate,
    required ApiHeader Function() apiHeaderCallback,
  }) {
    return _search(
      body: {'acc_creation_date': accCreationDate},
      apiHeaderCallback: apiHeaderCallback,
    );
  }

  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> _search({
    required Map<String, dynamic> body,
    required ApiHeader Function() apiHeaderCallback,
  }) async {
    try {
      final apiHeader = apiHeaderCallback();
      final uri = Uri(
        scheme: 'https',
        host: HttpService.hostSearch,
        path: 'default/AdminPanelSearch',
      );

      final response = await _client.post(
        uri,
        body: json.encode(body),
        headers: apiHeader.jsonHeaderMap,
      );

      final result = decodeResponseBody(response.bodyBytes);
      final generalFailure = _handleGeneralErrors(response.statusCode, result);

      if (generalFailure != null) return left(generalFailure);
      final users = result['users'] as List<dynamic>;
      final list = users.map((e) => CustomerModel.fromMap(e)).toList();

      return right(list);
    } on SocketException catch (_) {
      return left(const SearchRepositoryConnectionFailure());
    } catch (e) {
      log(e.toString());
      return left(SearchRepositoryUnknownFailure(e.toString()));
    }
  }

  SearchRepositoryFailure? _handleGeneralErrors(
      int statusCode, Map<String, dynamic> result) {
    final errorMap = result['error_msg'] as String?;
    if (errorMap != null) {
      return SearchRepositoryUnknownFailure(errorMap);
    }
    if (statusCode == 200) return null;

    if (statusCode == 404) {
      return const SearchRepositoryNotFoundFailure();
    } else if (statusCode == 500) {
      return const SearchRepositoryInternalFailure();
    } else {
      return SearchRepositoryUnknownFailure("Error code: $statusCode");
    }
  }
}
