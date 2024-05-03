import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      height: getDeviceHeight(context) * 0.47,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.32,
        bottom: getDeviceHeight(context) * 0.11,
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.7),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3.0, blurRadius: 12.0, blurStyle: BlurStyle.normal)]
      ),
      child: Column(
        children: [

          // Number Field
          Container(
            width: getDeviceWidth(context) * 0.8,
            height: getDeviceHeight(context) * 0.1,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) * 0.05,
              right: getDeviceWidth(context) * 0.05,
              bottom: getDeviceHeight(context) * 0.025
            ),
            child: Row(
              children: [

                // Number Country Code
                InkWell(
                  onTap: (){
                    viewModel.isFlagSelection = true;
                    viewModel.isHistoryEdited = true;
                    viewModel.notifyListeners();
                  },
                  child : Container(
                  width: getDeviceWidth(context) * 0.1,
                  height: getDeviceHeight(context) * 0.05,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(55),
                    boxShadow: const [BoxShadow(color: Colors.black, blurStyle: BlurStyle.normal, spreadRadius: 2.0, blurRadius: 10.0)],
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(viewModel.numbers[viewModel.choosedNumberHistory].numberCountryFlag)
                    )
                    ),
                  ),
                ),

                // Number Field
                Container(
                  width: getDeviceWidth(context) * 0.5,
                  height: getDeviceHeight(context) * 0.07,
                  margin: EdgeInsets.only(
                    left: getDeviceWidth(context) * 0.05,
                    right: getDeviceWidth(context) * 0.05
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    color: Colors.white,
                    boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10.0, spreadRadius: 1.0, blurStyle: BlurStyle.normal)]
                  ),
                  child : TextField(

                    onTap: (){
                      viewModel.isKeyboardEnabled = true;
                      viewModel.notifyListeners();
                    },

                    onEditingComplete: (){
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      viewModel.isHistoryEdited = true;
                      viewModel.isKeyboardEnabled = false;
                      viewModel.notifyListeners();
                    },
                    onTapOutside: (_){
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      viewModel.isHistoryEdited = true;
                      viewModel.isKeyboardEnabled = false;
                      viewModel.notifyListeners();
                    },
                  style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.055, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter a phone",
                      hintStyle: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.05, fontWeight: FontWeight.bold)
                  ),
                  controller: viewModel.numberField,
                  keyboardType: TextInputType.number,
                 ),
                ),

                // Number Send Button
                InkWell(
                  onTap : (){
                    viewModel.openNumberChat();
                    if (viewModel.messageField.text != viewModel.numbers[viewModel.choosedNumberHistory].numberMessage ){
                      viewModel.addNumberToHistory();
                    } else if (viewModel.isEditedCountryCode) {
                      viewModel.modifyExistingNumber(viewModel.tempCountryCode);
                    }
                 },
                  child : Container(
                  width: getDeviceWidth(context) * 0.1,
                  height: getDeviceHeight(context) * 0.1,
                  child: const Icon(Icons.send_rounded, color: Colors.blueAccent, size: 45,),
                  )
                ),
            ],
         )
          ),

          // Text Field
          Container(
            height: getDeviceHeight(context) * 0.15,
            width: getDeviceWidth(context) * 0.8,
            margin: EdgeInsets.only(
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
              onTap: (){
                viewModel.isEditingMessage = true;
                viewModel.notifyListeners();
              },

              onTapOutside: (_){
                viewModel.isEditingMessage = false;
                viewModel.notifyListeners();
              },

              onEditingComplete: (){
                viewModel.isEditingMessage = true;
                viewModel.notifyListeners();
              },

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