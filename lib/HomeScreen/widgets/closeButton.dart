import 'package:flutter/material.dart';
import '../../exports.dart';

class CustomCloseButton extends StatelessWidget{
  @override
  const CustomCloseButton({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.25,
      height: getDeviceHeight(context) * 0.12,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.85,
        bottom: getDeviceHeight(context) * 0.025,
        left: getDeviceWidth(context) * 0.375,
        right: getDeviceWidth(context) * 0.375
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(126),
        boxShadow: const [BoxShadow(color: Colors.white, spreadRadius: 2.0, blurRadius: 10.0, blurStyle: BlurStyle.inner)],
      ),
      child: Column(
        children: [
          const Spacer(),
          IconButton(
            onPressed: (){
              viewModel.messageField.text = "";
              viewModel.numberField.text = "";
              viewModel.choosedNumberHistory = 0;
              viewModel.chooseDetailsScreen = false;
              viewModel.isEditedCountryCode = false;
              viewModel.notifyListeners();
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black.withOpacity(0.7), size: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.2,),
          ),
          const Spacer(),
        ],

      ),
    );
  }
}