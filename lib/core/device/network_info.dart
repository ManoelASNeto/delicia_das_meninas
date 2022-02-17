import 'package:connectivity/connectivity.dart';

abstract class INetworkInfo {
  Future<bool> get isConnectd;
}

class NetworkInfo implements INetworkInfo {
  final Connectivity connectivity;

  NetworkInfo(this.connectivity);

  @override
  Future<bool> get isConnectd async {
    final status = await connectivity.checkConnectivity();
    return status != ConnectivityResult.none;
  }
}
