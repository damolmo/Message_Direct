import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class TelegramButton extends StatelessWidget{
  @override
  const TelegramButton({
    required this.viewModel,
    super.key,
});
  
  final HomeScreenModel viewModel;
  
  @override
  Widget build(BuildContext context){
    return Container(
          width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.8,
          height: getDeviceWidth(context) > 580 ?  getDeviceHeight(context) * 0.15 : getDeviceHeight(context) * 0.1,
          margin: EdgeInsets.only(
            top: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.25 : getDeviceHeight(context) * 0.35,
            left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.35 : getDeviceWidth(context) * 0.1,
            right: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.35 : getDeviceWidth(context) * 0.1
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5.0, blurStyle: BlurStyle.normal, spreadRadius: 3.0)],
            color: viewModel.isWhatsAppUrl ? whatsAppBackgroundColor : telegramBackgroundColor
          ),
          child: InkWell(
            onTap: (){
              viewModel.isWhatsAppUrl ?  viewModel.isWhatsAppUrl = false : viewModel.isWhatsAppUrl = true;
              viewModel.notifyListeners();
            },
            child :  Row(
              children: [
                // App Icon
                Container(
                  width: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.1 : getDeviceWidth(context) * 0.2,
                  margin: EdgeInsets.only(
                    left: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.05
                  ),
                  child: Icon(viewModel.isWhatsAppUrl ? Icons.chat_bubble_rounded :  Icons.telegram_rounded, color: Colors.white, size: 35,),
                ),

                // App Text
                Container(
                  width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.15 :getDeviceWidth(context) * 0.5,
                  margin: EdgeInsets.only(
                    top: getDeviceHeight(context) * 0.025,
                    bottom: getDeviceHeight(context) * 0.025,
                    right: getDeviceWidth(context) * 0.025
                  ),
                  child: Center(child: Text(viewModel.isWhatsAppUrl ? "WhatsApp Mode" : "Telegram Mode", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.015 : getDeviceWidth(context) * 0.05), textAlign: getDeviceWidth(context) > 580 ? TextAlign.left : TextAlign.center,)),
                )
              ],
          ),
        ),
    );
  }
}