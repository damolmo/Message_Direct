import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../exports.dart';

class SettingsBanner extends StatelessWidget{
  @override
  const SettingsBanner({
    required this.viewModel,
    super.key
});

  final SettingsScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width:  getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.9,
      height:  getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.3,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.35: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.25: getDeviceWidth(context) * 0.05,
        bottom: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.8 : getDeviceHeight(context) * 0.7
      ),
      child: Row(
        children: [
          // Settings Icon
          SizedBox(
            width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.3,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.05 : getDeviceHeight(context) * 0.1  ,
            child: Icon(Icons.settings_rounded, color: Colors.white, size:  getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.1 : getDeviceWidth(context) * 0.3, shadows: const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 13.0)]),
          ),

          // Settings Text
          Container(
            width:  getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.6,
            height:  getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.14 : getDeviceHeight(context) * 0.25,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.05 : 0.0,
              top: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.08 : getDeviceHeight(context) * 0.09,
              bottom: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.0 : getDeviceHeight(context) * 0.05,
            ),
            child: Row(
              children: [
                const Spacer(),
                Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.042 : getDeviceWidth(context) * 0.13, shadows: getDeviceWidth(context) > 580 ? const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 9.0)] : const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 13.0)]),),
                const Spacer(),
             ],
            )
          )
        ],
      ),
    );
  }

}