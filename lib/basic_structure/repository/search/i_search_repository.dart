import 'package:cubtale/basic_structure/failure/search/login_repository_failure.dart';
import 'package:cubtale/core/common/api_header.dart';
import 'package:cubtale/core/model/customer/customer_model.dart';
import 'package:dartz/dartz.dart';

abstract class ISearchRepository {

  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> searchEmail({
    required String email,
    required ApiHeader Function() apiHeaderCallback,
  });
  Future <Either<SearchRepositoryFailure, List<CustomerModel>>> searchId({
    required String accId,
    required ApiHeader Function() apiHeaderCallback,
  });
  Future<Either<SearchRepositoryFailure, List<CustomerModel>>> searchDate({
    required String accCreationDate,
    required ApiHeader Function() apiHeaderCallback,
  });
 
}
