import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectionSubscription;

  ConnectionStatusCubit() : super(ConnectionStatus.online) {
    _connectionSubscription = _connectivity.onConnectivityChanged
        .listen((_) => _checkInternetConnection());
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      // Sometimes the callback is called when we reconnect to wifi, but the internet is not really functional
      // This delay try to wait until we are really connected to internet
      final ConnectivityResult connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.ethernet ||
          connectivityResult == ConnectivityResult.wifi) {
        await Future.delayed(const Duration(seconds: 2));
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          emit(ConnectionStatus.online);
        } else {
          emit(ConnectionStatus.noInternetAccess);
        }
      } else {
        _checkInternetConnection();
        emit(ConnectionStatus.offline);
      }
    } on SocketException catch (_) {
      emit(ConnectionStatus.offline);
    }
  }

  @override
  Future<void> close() {
    _connectionSubscription.cancel();
    return super.close();
  }
}

enum ConnectionStatus {
  online,
  noInternetAccess,
  offline,
}
