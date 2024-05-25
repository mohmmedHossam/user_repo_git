import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repo_git/Core/Managers/ColorManager.dart';
import 'package:user_repo_git/Core/Utils/singleton_services.dart';
import 'package:user_repo_git/Features/Controllers/user_cubit.dart';
import 'package:user_repo_git/Features/Repos/user_repo_impl.dart';
import 'package:user_repo_git/Features/Screens/HomeScreen/HomeScreen.dart';
import 'package:user_repo_git/Features/Screens/InternetChecked/presentation/viewModel/check_internet_cubit.dart';

import 'Features/Screens/InternetChecked/presentation/view/general_check_internet.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupSingletons();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => ConnectionStatusCubit()),
        BlocProvider(
            create: (context) => UserCubit(getFromSingleton<UserRepoImpl>()))
      ],
      child: MaterialApp(
        builder: (context, child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(
                textScaleFactor:
                    data.textScaleFactor >= 1.3 ? 1.2 : data.textScaleFactor),
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorManager.lightBlue),
          useMaterial3: true,
        ),
        home: const GeneralCheckInternetPage(widget: HomeScreen()),
        //  home: AdvertisementDetails(),
      ),
    );
  }
}
