import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class SettingsMenu extends StatelessWidget{
  @override
  const SettingsMenu({
    required this.viewModel,
    super.key
});

  final SettingsScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      height: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.4 : getDeviceHeight(context) * 0.6,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.05,
        right:  getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.3 :getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.25,
      ),
      child: ListView.builder(
          itemCount: viewModel.settings.length,
          itemBuilder: (context, index){
            return Container(
              width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.4 : getDeviceWidth(context) * 0.8,
              height: getDeviceHeight(context) * 0.125,
              margin: EdgeInsets.only(
                top: getDeviceHeight(context) * 0.025,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: whatsAppBackgroundColor,
                boxShadow: const  [BoxShadow(color: Colors.black, blurRadius: 12.0, blurStyle: BlurStyle.normal, spreadRadius: 2.0)]
              ),
              child: Column(
                children: [
                  const Spacer(),
                  ListTile(
                    focusColor: Colors.black,
                    onFocusChange: (_){

                    },
                    onTap: (){
                      if (index == 1){
                        viewModel.exportData(context);
                      } else if (index == 2){
                        viewModel.importData(context);
                      } else  if (index == 3) {
                        viewModel.navigateToDesiredView(context, "about");
                      } else {
                        print(getDeviceWidth(context));
                        viewModel.notifyUser("This option isn't available right now", context);
                      }
                    },
                    leading: Icon(IconData(viewModel.settings[index].settingIcon, fontFamily: "MaterialIcons"), size: getDeviceWidth(context) > 480 ? 24 : 44, color: Colors.white,),
                    title: Text(viewModel.settings[index].settingTitle, style: TextStyle(color: Colors.white, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold), textAlign: TextAlign.left,) ,
                    subtitle: Text(viewModel.settings[index].settingSubtitle, style: TextStyle(color: Colors.white, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.01 :getDeviceWidth(context) * 0.03, fontWeight: FontWeight.bold), textAlign: TextAlign.left,) ,
                    trailing: const Icon(Icons.keyboard_arrow_right_outlined, color: Colors.white, size: 55,) ,
                  ),
                  const Spacer(),
                ],
              )
            );
        },
      ),
    );
  }

}