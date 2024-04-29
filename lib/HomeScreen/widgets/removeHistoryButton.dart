import 'package:flutter/material.dart';
import '../../exports.dart';

class RemoveHistoryButton extends StatelessWidget{
  @override
  const RemoveHistoryButton({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.7,
      height: getDeviceHeight(context) * 0.1,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) * 0.15,
        right: getDeviceWidth(context) * 0.15,
        top: getDeviceHeight(context) * 0.72,
        bottom: getDeviceHeight(context) * 0.18
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 12.0, blurStyle: BlurStyle.normal, spreadRadius: 1.0)]
      ),
      child: TextButton(
        onPressed: (){
          viewModel.dropExistingHistory();
        },
        style: TextButton.styleFrom(
          backgroundColor: Colors.redAccent
        ),
        child: Text("Clean History", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) * 0.06),),
      ),
    );
  }

}