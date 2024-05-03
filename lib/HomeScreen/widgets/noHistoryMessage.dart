import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class NoHistoryMessage extends StatelessWidget{
  @override
  const NoHistoryMessage({
    super.key
});

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.4 : getDeviceWidth(context) * 0.6,
      height: getDeviceHeight(context) * 0.4,
      margin: EdgeInsets.only(
          top: getDeviceHeight(context) * 0.45,
          bottom: getDeviceHeight(context) * 0.15,
          left: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.2,
          right: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.2
      ),
      child: Text("Ups...\nNothing to show here", style: TextStyle(color: Colors.white, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.04 : getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
    );
  }

}