import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

abstract class ConnectionManager {
  Future<bool> checkConnection();
}

@LazySingleton(as: ConnectionManager)
class ConnectionManagerImpl implements ConnectionManager {
  final Connectivity _connectivity;

  const ConnectionManagerImpl(this._connectivity);

  @override
  Future<bool> checkConnection() async {
    final List<ConnectivityResult> results = await _connectivity
        .checkConnectivity();

    return results.contains(ConnectivityResult.mobile) ||
        results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.ethernet);
  }
}
