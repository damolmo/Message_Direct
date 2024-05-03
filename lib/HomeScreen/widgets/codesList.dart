import 'package:flutter/material.dart';
import '../../exports.dart';

class CodesList extends StatelessWidget{
  @override
  const CodesList({
    required this.viewModel,
    super.key
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.5 : getDeviceWidth(context) * 0.9,
      margin: EdgeInsets.only(
        left: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.25 : getDeviceWidth(context) * 0.05,
        top: getDeviceHeight(context) * 0.05,
        bottom: getDeviceHeight(context) * 0.05
      ),
      child: ListView.builder(
          itemCount: viewModel.codes.length,
          itemBuilder: (context, index){
            return Container(
              width: getDeviceWidth(context) * 0.8,
              margin: EdgeInsets.only(
                top: getDeviceHeight(context) * 0.025,
                left: getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) * 0.05,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 10.0, blurStyle: BlurStyle.normal, spreadRadius: 1.0)]
              ),
              child: ListTile(
                leading: Container(
                  width: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.07 : getDeviceWidth(context) * 0.15,
                  child : Image.asset(fit: BoxFit.fitWidth, viewModel.codes[index].countryFlag)),
                title: Text(viewModel.codes[index].countryCode, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 580 ? getDeviceWidth(context) * 0.03 : getDeviceWidth(context) * 0.06),) ,
                subtitle:Text(viewModel.codes[index].countryAbreviation, style: const TextStyle(color: Colors.black,
                ),
                ),
                trailing: IconButton(
                  onPressed: (){
                    if (viewModel.isDialerSelected){
                      viewModel.isFlagSelection = false;
                      viewModel.choosedCountryCode = index;
                      viewModel.notifyListeners();
                    } else {
                      viewModel.isHistoryEdited = true;
                      viewModel.tempCountryCode = index;
                      viewModel.isEditedCountryCode = true;
                      viewModel.isFlagSelection = false;
                      viewModel.modifyExistingNumber(index);
                      viewModel.notifyListeners();
                    }


                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black.withOpacity(0.6), size: 40,),
                ),
              ),
            );
          },
        )
     );
  }

}