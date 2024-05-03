import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class AppBanner extends StatelessWidget{
  @override
  const AppBanner({
    super.key
});

  @override
  Widget build(BuildContext context){
    return Container(
      height: getDeviceHeight(context) * 0.2,
      width: getDeviceWidth(context) * 0.8,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.1,
        right: getDeviceWidth(context) * 0.1,
        top: getDeviceHeight(context) * 0.025,
        bottom: getDeviceHeight(context) * 0.775
      ),
      child: Row(
        children: [
          // App Icon
          Container(
            width: getDeviceWidth(context) * 0.4,
            height: getDeviceHeight(context) * 0.4,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: getDeviceWidth(context) > 480 ?  BoxFit.fitHeight : BoxFit.fitWidth,
                image: AssetImage("assets/logo/logo.png")
              )
            ),

          ),

          // App Brand Name
          Container(
            width: getDeviceWidth(context) * 0.3,
            height: getDeviceHeight(context) * 0.15,
            margin: EdgeInsets.only(
              top: getDeviceHeight(context) * 0.05,
              bottom: getDeviceHeight(context) * 0.025,
              right: getDeviceWidth(context) * 0.05
            ),
            child: Text("Message Direct", style: TextStyle(color: Colors.white, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.04 : getDeviceWidth(context) * 0.07, fontWeight: FontWeight.bold, shadows : const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 12.0 )]), textAlign: TextAlign.left,),
          )
        ],
      ),

    );
  }


}