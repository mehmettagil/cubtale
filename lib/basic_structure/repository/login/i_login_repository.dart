import 'package:cubtale/basic_structure/failure/login/login_repository_failure.dart';
import 'package:cubtale/core/common/api_header.dart';
import 'package:cubtale/core/model/user/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginRepository {
  Future<Either<LoginRepositoryFailure, UserModel>> login({
    required String email,
    required String password,
    required ApiHeader Function() apiHeaderCallback,
  });
}
