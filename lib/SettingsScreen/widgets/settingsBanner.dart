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
      width: getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.2,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.05,
        bottom: getDeviceHeight(context) * 0.05
      ),
      child: Row(
        children: [
          // Settings Icon
          SizedBox(
            width: getDeviceWidth(context) * 0.3,
            height: getDeviceWidth(context) * 0.3,
            child: Icon(Icons.settings_rounded, color: Colors.white, size: getDeviceWidth(context) * 0.3, shadows: const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 13.0)]),
          ),

          // Settings Text
          Container(
            width: getDeviceWidth(context) * 0.5,
            height: getDeviceHeight(context) * 0.2,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) *  0.05,
              right: getDeviceWidth(context) * 0.05,
              top: getDeviceHeight(context) * 0.05,
              bottom: getDeviceHeight(context) * 0.05
            ),
            child: Text("Settings", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) * 0.13, shadows: const [Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 13.0)]),),
          )
        ],
      ),
    );
  }

}