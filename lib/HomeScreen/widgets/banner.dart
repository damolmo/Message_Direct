import 'package:flutter/material.dart';
import '../../exports.dart';

class DirectBanner extends StatelessWidget{
  @override
  const DirectBanner({
    required this.viewModel,
    super.key
});

  final viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.6 : getDeviceWidth(context) * 0.6,
      height: getDeviceWidth(context) > 580 ? getDeviceHeight(context) * 0.2 : getDeviceHeight(context) * 0.3,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.025,
        bottom: getDeviceHeight(context) * 0.675,
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.3,
        right: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.2 : getDeviceWidth(context) * 0.3
      ),
      child: InkWell(
          onTap : (){
            viewModel.enabledEasterEgg ? viewModel.enabledEasterEgg = false : viewModel.enabledEasterEgg = true;
            viewModel.notifyListeners();
        },
        child : Image(
        fit: BoxFit.fitHeight,
          image : AssetImage(viewModel.getBannerAsset())
        )
      ),
    );
  }
}