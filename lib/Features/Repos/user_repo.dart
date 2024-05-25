import 'package:dartz/dartz.dart';
import 'package:user_repo_git/Core/Managers/failures.dart';
import 'package:user_repo_git/Features/Models/userModel.dart';

abstract class UserRepo{
  Future<Either<Failure, UserModel>> fetchUserData(userName);
}