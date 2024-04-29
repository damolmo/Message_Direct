import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class SafeWidthAlert extends StatelessWidget{
  @override
  const SafeWidthAlert({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) < 600 ? getDeviceWidth(context) * 0.9 :  getDeviceWidth(context) * 0.4,
      height: getDeviceWidth(context) < 600 ? getDeviceHeight(context) * 0.4 : getDeviceHeight(context) * 0.3,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) < 600 ? getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.3 ,
        right: getDeviceWidth(context) < 600 ? getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.3,
        top: getDeviceWidth(context) < 600 ? getDeviceHeight(context) * 0.4 :  getDeviceHeight(context) * 0.4,
        bottom: getDeviceWidth(context) < 600 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.3
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [BoxShadow(color: Colors.black, blurStyle: BlurStyle.normal, blurRadius: 10.0, spreadRadius: 3.0)]
      ),
      child: Column(
        children: [
          const Spacer(),
          Text("This device isn't allowed!\n\nUse a smartphone or reduce your screen width.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) < 600 ? getDeviceWidth(context) * 0.06 : getDeviceWidth(context) * 0.02), textAlign: TextAlign.center,),
          const Spacer(),
        ],
      ) ,
    );
  }

}