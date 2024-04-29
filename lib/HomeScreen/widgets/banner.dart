import 'package:flutter/material.dart';
import '../../exports.dart';

class DirectBanner extends StatelessWidget{
  @override
  const DirectBanner({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) <= 480 ? getDeviceWidth(context) * 0.6 : getDeviceWidth(context) * 0.4,
      height: getDeviceWidth(context) <= 480 ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0.2,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.025,
        bottom: getDeviceHeight(context) * 0.675,
        left: getDeviceWidth(context) <= 480 ? getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.3,
        right: getDeviceWidth(context) <= 480 ? getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.3
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: getDeviceWidth(context) <= 480 ? BoxFit.fill : BoxFit.fitHeight,
          image: const AssetImage("assets/logo/logo.png")
        )
      ),
    );
  }
}