import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repo_git/Core/Managers/constant.dart';
import 'package:user_repo_git/Core/Utils/api_services.dart';
import 'package:user_repo_git/Features/Repos/user_repo_impl.dart';

final getIt = GetIt.instance;

Future setupSingletons() async {
  getIt.registerSingleton<ApiServices>(ApiServices(Dio()));

  getIt.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  getIt.registerSingleton<Constant>(Constant());

  getIt.registerSingleton<UserRepoImpl>(
      UserRepoImpl(getFromSingleton<ApiServices>()));
}

T getFromSingleton<T extends Object>() {
  return getIt.get<T>();
}
