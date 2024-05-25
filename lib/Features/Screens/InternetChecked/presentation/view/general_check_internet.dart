import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repo_git/Features/Screens/InternetChecked/presentation/view/no_Internet_access.dart';
import '../viewModel/check_internet_cubit.dart';
import 'offline_internet.dart';

class GeneralCheckInternetPage extends StatelessWidget {
  final Widget widget;

  const GeneralCheckInternetPage({Key? key, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
      builder: (context, state) {
        if (state == ConnectionStatus.online) {
          return Scaffold(body: widget);
        }else if (state == ConnectionStatus.noInternetAccess) {
          return const NoInternetAccessPage();
        } else {
          return const OfflineInternetPage();
        }
      },
    );
  }
}
