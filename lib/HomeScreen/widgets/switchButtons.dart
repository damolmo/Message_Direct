import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_direct/variables.dart';
import '../../exports.dart';

class SwitchButtons extends StatelessWidget{
  @override
  const SwitchButtons({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: kIsWeb ? getDeviceWidth(context) * 0.55 : getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.84,
        bottom: getDeviceHeight(context) * 0.06,
        left: kIsWeb ? getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.05,
        right: kIsWeb ? getDeviceWidth(context) * 0.22 : getDeviceWidth(context) * 0.05
     ),
      child: Row(
        children: [
          // Dialer Button
          InkWell(
            onTap : () {
              viewModel.isDialerSelected = true;
              viewModel.notifyListeners();
            },
            child : Container(
                  width: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.425,
                  height: getDeviceHeight(context) * 0.1,
                  margin: EdgeInsets.only(
                    right: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.05
                  ),
                  decoration: BoxDecoration(
                      color: viewModel.isDialerSelected ? Colors.white :  viewModel.getAppColor(),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 4.0, spreadRadius: 2.0, blurStyle: BlurStyle.normal)]
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                        left: getDeviceWidth(context) * 0.07,
                        right: getDeviceWidth(context) * 0.05
                    ),
                    child: Row(
                      children: [
                        // Dialer Icon
                        Icon(Icons.phone_rounded, color: viewModel.isDialerSelected ? Colors.black : Colors.white, size: 35,),
                        // Dialer Text
                        Text("Dialer", style: TextStyle(color: viewModel.isDialerSelected ? Colors.black : Colors.white, fontSize: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.05, fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  ),
                ),

          // History Button
          InkWell(
            onTap: (){
              // This is needed to allow UI to refresh data
              viewModel.getNumbersHistory();
              viewModel.isDialerSelected = false;
              viewModel.notifyListeners();
            },
            child : Container(
              width:  getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.25 :getDeviceWidth(context) * 0.425,
              height: getDeviceHeight(context) * 0.1,
              decoration: BoxDecoration(
                  color: viewModel.isDialerSelected ? viewModel.getAppColor() : Colors.white ,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 4.0, spreadRadius: 2.0, blurStyle: BlurStyle.normal)]
              ),
              child: Container(
                margin: EdgeInsets.only(
                  left: getDeviceWidth(context) * 0.07,
                  right: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.025 :getDeviceWidth(context) * 0.05
                ),
                child: Row(
                children: [
                  // Dialer Icon
                  Icon(Icons.history_edu_rounded, color: viewModel.isDialerSelected ? Colors.white : Colors.black, size: 35,),
                  // Dialer Text
                  Text("History", style: TextStyle(color: viewModel.isDialerSelected ? Colors.white : Colors.black, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.05, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}