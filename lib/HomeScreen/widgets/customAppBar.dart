import 'package:flutter/material.dart';
import '../../exports.dart';

class CustomAppBar extends StatelessWidget{
  @override
  const CustomAppBar({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context),
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.75,
        bottom: getDeviceHeight(context) * 0.9,
      ),
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.black, blurStyle: BlurStyle.normal, blurRadius: 12.0, spreadRadius: 2.0)],
        color: viewModel.isWhatsAppUrl ? whatsAppBackgroundColor : telegramBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20)
        )
      ),
      child: InkWell(
        onTap :  (){
          viewModel.navigateToDesiredView(context, "settings");
        },
        child : const Icon(Icons.settings_rounded, size: 40, color: Colors.white,)
      ),
    );
  }

}