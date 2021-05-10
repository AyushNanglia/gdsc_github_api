import 'dart:async';

import 'enums.dart';
import 'package:connectivity/connectivity.dart';
import 'package:provider/provider.dart';

class connecStatus{

  StreamController<ConnectivityStatus> connectionStatusController = StreamController<ConnectivityStatus>();

  connecStatus(){
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Use Connectivity() here to gather more info if you need t

      connectionStatusController.add(_getStatusFromResult(result));
    });
  }

  ConnectivityStatus _getStatusFromResult(ConnectivityResult result){
    switch (result) {
      case ConnectivityResult.mobile:
        return ConnectivityStatus.Cellular;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.WiFi;
      case ConnectivityResult.none:
        return ConnectivityStatus.Offline;
      default:
        return ConnectivityStatus.Offline;
    }
  }

}

