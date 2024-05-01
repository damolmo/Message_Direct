import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class NumberDetails extends StatelessWidget{
  @override
  const NumberDetails({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.9,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.3,
        bottom: getDeviceHeight(context) * 0.15
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3.0, blurRadius: 12.0, blurStyle: BlurStyle.normal)]
      ),
      child: Column(
        children: [
          // Text Field
          Container(
            height: getDeviceHeight(context) * 0.2,
            width: getDeviceWidth(context) * 0.8,
            margin: EdgeInsets.only(
              top: getDeviceHeight(context) * 0.025,
              bottom: getDeviceHeight(context) * 0.025,
              left: getDeviceWidth(context) * 0.05,
              right: getDeviceWidth(context) * 0.05
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.5), spreadRadius: 1.0, blurRadius: 8.0, blurStyle: BlurStyle.normal)]
            ),
            child: TextField(
              style:TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold),
              maxLines: 30,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold),
                hintText: "Write a Message"
              ),
              controller: viewModel.messageField,
              keyboardType: TextInputType.multiline,
            ),
          ),

          // Send Button
          InkWell(
            onTap : (){
            viewModel.openNumberChat();
            },
            child : Container(
              width: getDeviceWidth(context) * 0.9,
              height: getDeviceHeight(context) * 0.12,
              margin: EdgeInsets.only(
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05,
                top: getDeviceHeight(context) * 0.02,
              ),
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), blurStyle: BlurStyle.normal, blurRadius: 6.0, spreadRadius: 1.0)]
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text("Send", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) * 0.07),),
                  const Spacer(),
                ],
              ),
            )
          ),

          // Delete Button
          InkWell(
            onTap : (){
              viewModel.dropSingleNumber();
              viewModel.chooseDetailsScreen = false;
              viewModel.messageField.text = "";
              viewModel.notifyListeners();
            },
            child : Container(
              width: getDeviceWidth(context) * 0.9,
              height: getDeviceHeight(context) * 0.12,
              margin: EdgeInsets.only(
                  left: getDeviceWidth(context) * 0.05,
                  right: getDeviceWidth(context) * 0.05,
                  top: getDeviceHeight(context) * 0.02,
                  bottom: getDeviceHeight(context) * 0.02
              ),
              decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.9), blurStyle: BlurStyle.normal, blurRadius: 6.0, spreadRadius: 1.0)]
              ),
              child: Column(
                children: [
                  const Spacer(),
                  Text("Delete", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) * 0.07),),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}