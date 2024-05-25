import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:user_repo_git/Core/Managers/constant.dart';
import 'package:user_repo_git/Core/Managers/end_points.dart';
import 'package:user_repo_git/Core/Managers/failures.dart';
import 'package:user_repo_git/Core/Utils/api_services.dart';
import 'package:user_repo_git/Features/Models/userModel.dart';
import 'package:user_repo_git/Features/Repos/user_repo.dart';

class UserRepoImpl implements UserRepo {

  UserRepoImpl(this.apiServices);

  ApiServices apiServices;

  @override
  Future<Either<Failure, UserModel>> fetchUserData(userName) async {
    try {
      var response = await apiServices.get(endPoint: "$userEp$userName");
      if (response.statusCode == Constant.successResponse) {
        return right(userModelFromJson(response.data));
      } else {
        return Left(
            ServerError.fromResponse(response.statusCode ?? 0, response.data));
      }
    } catch (e) {
      if (e is DioException) {
        return Left(ServerError.fromDioError(e));
      } else {
        printDB("Error $e");
        return left(ServerError(errorMessage: 'Ops UnExpected Error'));
      }
    }
  }
}
