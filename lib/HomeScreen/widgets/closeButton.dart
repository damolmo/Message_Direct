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
      width: getDeviceWidth(context) * 0.2,
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.875,
        bottom: getDeviceHeight(context) * 0.025,
        left: getDeviceWidth(context) * 0.4,
        right: getDeviceWidth(context) * 0.4
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(75),
        boxShadow: const [BoxShadow(color: Colors.white, spreadRadius: 2.0, blurRadius: 10.0, blurStyle: BlurStyle.inner)],
      ),
      child: IconButton(
        onPressed: (){
          viewModel.messageField.text = "";
          viewModel.choosedNumberHistory = 0;
          viewModel.chooseDetailsScreen = false;
          viewModel.notifyListeners();
        },
        icon: Icon(Icons.close_rounded, color: Colors.black.withOpacity(0.7), size: 50,),
      ),
    );
  }
}