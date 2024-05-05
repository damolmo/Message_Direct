import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../exports.dart';

class SearchCodeField extends StatelessWidget{
  @override
  const SearchCodeField({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.4 :  getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.3 : getDeviceWidth(context) * 0.05,
        top: viewModel.isKeyboardEnabled ? getDeviceHeight(context) * 0.05 : getDeviceHeight(context) * 0.875,
        bottom: viewModel.isKeyboardEnabled ? getDeviceHeight(context) * 0.85 : getDeviceHeight(context) * 0.025
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [BoxShadow(color: Colors.black, offset: Offset.zero, blurStyle: BlurStyle.normal, blurRadius: 12.0, spreadRadius: 2.0)]
      ),
      child: TextField(
        onTap: (){
          viewModel.isKeyboardEnabled = true;
          viewModel.notifyListeners();
        },

        onTapOutside: (_){
          viewModel.isKeyboardEnabled = false;
          viewModel.autoRefreshCodesList(context);
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },

        onSubmitted: (_){
          viewModel.isKeyboardEnabled = false;
          viewModel.autoRefreshCodesList(context);
          SystemChannels.textInput.invokeMethod('TextInput.hide');
        },

        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.038 : getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Enter Country (e.g 'ES')",
          hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ?  getDeviceWidth(context) * 0.038 : getDeviceWidth(context) * 0.06)
        ),
        keyboardType: TextInputType.text,
        controller: viewModel.codeField,
      ),

    );
  }

}