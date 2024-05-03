import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../exports.dart';

class MessageField extends StatelessWidget{
  @override
  const MessageField({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.5 : getDeviceWidth(context) * 0.9,
      height: getDeviceWidth(context) > 480 ? getDeviceHeight(context) * 0.2 : viewModel.isMessageFieldActive ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0.12,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.05,
        top: getDeviceWidth(context) > 480 ? getDeviceHeight(context) * 0.6 : viewModel.isMessageFieldActive ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0.7,
        bottom: getDeviceWidth(context) > 480 ? getDeviceHeight(context) * 0.25 : viewModel.isMessageFieldActive ? getDeviceHeight(context) * 0.3 : getDeviceHeight(context) * 0.18
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 8.0, blurStyle: BlurStyle.normal, spreadRadius: 3.0)]
      ),
      child: TextField(
        maxLines: 30,
        style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.035 : getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          border : InputBorder.none,
          hintText: "Write a message",
          hintStyle: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.03 :getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold)
        ),
        controller: viewModel.messageField,
        keyboardType: TextInputType.multiline,

        onTap: (){
          viewModel.isMessageFieldActive = true;
          viewModel.notifyListeners();
        },

        onEditingComplete: (){
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          viewModel.isMessageFieldActive = false;
          viewModel.notifyListeners();
        },

        onTapOutside: (_){
          SystemChannels.textInput.invokeMethod('TextInput.hide');
          viewModel.isMessageFieldActive = false;
          viewModel.notifyListeners();
        },


      ),

    );
  }

}