import 'package:connectivity/connectivity.dart';

class ConnectivityHelper{
  Future<bool> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return (connectivityResult != ConnectivityResult.none);
  }
}