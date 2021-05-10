import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:connectivity/connectivity.dart';

import 'enums.dart';

class connecSensitive extends StatelessWidget {
  final Widget child;
  //final double opacity;

  connecSensitive({
    this.child,
    //this.opacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

    if (connectionStatus == ConnectivityStatus.WiFi || connectionStatus == ConnectivityStatus.Cellular) {
      return child;
    }

    else return Container(
      alignment: Alignment.center,
      /*height: MediaQuery.of(context).size.height*1.0,
      width: MediaQuery.of(context).size.width*1.0,*/
      padding: EdgeInsets.all(20.0),
      color:Colors.red,
      child:Text("No Network",style:TextStyle(color: Colors.white)),
    );
  }
}