import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../exports.dart';

class AppDetails extends StatelessWidget{
  @override
  const AppDetails({
    required this.viewModel,
    super.key
});

  final AboutAppScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.6 : getDeviceWidth(context) * 0.9,
      height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.8 : getDeviceHeight(context) * 0.6,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.25,
        bottom: getDeviceHeight(context) * 0.05
      ),
      child: ListView(
        children: [
          // App version
          Container(
            width: getDeviceWidth(context) * 0.9,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.12,
            margin: EdgeInsets.only(
              top: getDeviceHeight(context) * 0.025,
              left: getDeviceWidth(context) * 0.05,
              right: getDeviceWidth(context) * 0.05
            ),
            decoration: BoxDecoration(
              color: whatsAppBackgroundColor,
              borderRadius: BorderRadius.circular(25),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 11.0, blurStyle: BlurStyle.normal, spreadRadius: 3.0)]
            ),
            child: ListTile(
              leading: const Icon(Icons.android_rounded, color: Colors.white, size: 40,),
              title: Text(appVersion, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.035 : getDeviceWidth(context) * 0.05), textAlign: TextAlign.left,) ,
              subtitle: Text("App version currently running", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.03), textAlign: TextAlign.left,) ,
            ),
          ),

          // App Build date
          Container(
            width: getDeviceWidth(context) * 0.9,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.12,
            margin: EdgeInsets.only(
                top: getDeviceHeight(context) * 0.03,
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05
            ),
            decoration: BoxDecoration(
                color: whatsAppBackgroundColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 11.0, blurStyle: BlurStyle.normal, spreadRadius: 3.0)]
            ),
            child: ListTile(
              leading: const Icon(Icons.access_time_rounded, color: Colors.white, size: 40,),
              title: Text(appUpdateTime, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.035 : getDeviceWidth(context) * 0.05), textAlign: TextAlign.left,) ,
              subtitle: Text("Build time of this app version", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.03), textAlign: TextAlign.left,) ,
            ),
          ),

          // App author
          Container(
            width: getDeviceWidth(context) * 0.9,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.12,
            margin: EdgeInsets.only(
                top: getDeviceHeight(context) * 0.03,
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05
            ),
            decoration: BoxDecoration(
                color: whatsAppBackgroundColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 11.0, blurStyle: BlurStyle.normal, spreadRadius: 3.0)]
            ),
            child: ListTile(
              onTap: (){
                launchUrl(Uri(scheme: 'https', host: 'github.com', path: 'damolmo/Message_Direct'));
              },
              leading: const Icon(Icons.code, color: Colors.white, size: 40,),
              title: Text(appDeveloper, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.035 : getDeviceWidth(context) * 0.05), textAlign: TextAlign.left,) ,
              subtitle: Text("Get the app source on GitHub", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.03), textAlign: TextAlign.left,) ,
            ),
          ),
        ],
      ),
    );
  }

}