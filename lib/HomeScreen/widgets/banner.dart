import 'package:flutter/material.dart';
import '../../exports.dart';

class DirectBanner extends StatelessWidget{
  @override
  const DirectBanner({
    super.key
});

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.6,
      height: getDeviceHeight(context) * 0.3,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.025,
        bottom: getDeviceHeight(context) * 0.675,
        left: getDeviceWidth(context) * 0.2,
        right: getDeviceWidth(context) * 0.2
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/logo/logo.png")
        )
      ),
    );
  }
}