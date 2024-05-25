import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_repo_git/Core/Managers/constant.dart';
import 'package:user_repo_git/Core/Utils/utils.dart';
import 'package:user_repo_git/Features/Models/userModel.dart';
import 'package:user_repo_git/Features/Repos/user_repo_impl.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userRepoImpl) : super(UserInitial());

  UserRepoImpl userRepoImpl;

  late UserModel userData;

  getUserData(String userName) async {
    emit(UserLoading());
    var data = await userRepoImpl.fetchUserData(userName);

    data.fold((onFailure) {
      printDB("Error ${onFailure.errorMessage}");
      Utils.showToast(onFailure.errorMessage);
      if (onFailure.statusCode == Constant.notFoundResponse) {
        emit(UserNotFound());
      } else {
        emit(UserFailure());
      }
    }, (onSuccess) {
      userData = onSuccess;
      emit(UserSuccess(userModel: onSuccess));
    });
  }
}
