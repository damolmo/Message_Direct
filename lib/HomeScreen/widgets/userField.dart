import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../exports.dart';

class UserField extends StatelessWidget{
  @override
  const UserField({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.5 : getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.27 : getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.23 : getDeviceWidth(context) * 0.05,
        top: getDeviceWidth(context) > 580 && viewModel.numberField.text.isNotEmpty && !viewModel.isKeyboardEnabled? getDeviceHeight(context) * 0.45 :  viewModel.numberField.text.isNotEmpty && !viewModel.isKeyboardEnabled ? getDeviceHeight(context) * 0.6 : viewModel.getKeyBoardTop(context) ,
        bottom: viewModel.numberField.text.isNotEmpty && !viewModel.isKeyboardEnabled ? getDeviceHeight(context) * 0.3 :viewModel.getKeyBoardBottom(context)
      ),
      child: Row(
        children: [
          // Country Code Flag
          InkWell(
            onTap: (){
              viewModel.isFlagSelection ? viewModel.isFlagSelection = false :  viewModel.isFlagSelection = true;
              viewModel.notifyListeners();
            },
            child : Container(
            width: getDeviceWidth(context) > 580  ? getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.12,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.1 : getDeviceHeight(context) * 0.055,
            margin: EdgeInsets.only(
              right: getDeviceWidth(context) * 0.065
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: viewModel.codes.isEmpty ? const AssetImage("assets/flags/us.png") : AssetImage(viewModel.backupCodes[viewModel.choosedCountryCode].countryFlag)
              )
            ),
            ),
          ),
          
          // Phone Field
          Container(
            width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.23 : getDeviceWidth(context) * 0.5,
            height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.1 : getDeviceHeight(context) * 0.07,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) > 580 ? 0.0 : getDeviceWidth(context) * 0.02
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [BoxShadow(color: Colors.black, spreadRadius: 1.0, blurStyle: BlurStyle.normal, blurRadius: 12.0)]
            ),
            child: TextField(
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context)  > 580 ? getDeviceWidth(context) * 0.035 : getDeviceWidth(context) * 0.06, fontWeight: FontWeight.bold ),
              onTap: (){
                viewModel.isKeyboardEnabled = true;
                viewModel.notifyListeners();
              },

              onEditingComplete: (){
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                viewModel.isKeyboardEnabled = false;
                viewModel.notifyListeners();
              },

              onTapOutside: (_){
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                viewModel.isKeyboardEnabled = false;
                viewModel.notifyListeners();
              },
              decoration: InputDecoration(
                hintText: "Enter a phone",
                hintStyle: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context)  > 580 ? getDeviceWidth(context) * 0.035 :getDeviceWidth(context)  * 0.06, fontWeight: FontWeight.bold ),
                border: InputBorder.none,
              ),
              controller: viewModel.numberField,
              keyboardType: TextInputType.number,
            ),
          ),
          
          // Send Button
          Container(
            width: getDeviceWidth(context) * 0.15,
            height: getDeviceHeight(context) * 0.1 ,
            margin: EdgeInsets.only(
              left: getDeviceWidth(context) > 580 ? 0.0 :getDeviceWidth(context) * 0.045
            ),
            child: IconButton(
              onPressed: (){
                if (viewModel.numberField.text.isNotEmpty){
                  viewModel.saveCurrentCountryCode();
                  viewModel.openNumberChat();
                  viewModel.addNumberToHistory();
                } else {
                  viewModel.notifyUserRequiredValue("Not a valid phone number!\nTry again", context);

                }

              },
              icon: const Icon(Icons.send, color: Colors.white, size: 40,),
            ),
          )
        ],
      ),

    );
  }
}