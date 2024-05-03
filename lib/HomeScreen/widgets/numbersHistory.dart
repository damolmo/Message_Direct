import 'package:flutter/material.dart';
import '../../exports.dart';

class NumbersHistory extends StatelessWidget{
  @override
  const NumbersHistory({
    required this.viewModel,
    super.key,
});

  final HomeScreenModel viewModel;

  @override
  Widget build(BuildContext context){
    return Container(
      width: getDeviceWidth(context) * 0.9,
      height: getDeviceHeight(context) * 0.4,
      margin: EdgeInsets.only(
        top: getDeviceHeight(context) * 0.3,
        bottom: getDeviceHeight(context) * 0.2,
        left: getDeviceWidth(context) * 0.05,
        right: getDeviceWidth(context) * 0.05
      ),
      child: ListView.builder(
          itemCount: viewModel.numbers.length,
          itemBuilder: (context, index){
            return Container(
              width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.44 : getDeviceWidth(context) * 0.9,
              height: getDeviceWidth(context) > 480 ? getDeviceHeight(context) * 0.15 : getDeviceHeight(context) * 0.1,
              margin: EdgeInsets.only(
                left: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.23 :getDeviceWidth(context) * 0.05,
                right: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.23 :getDeviceWidth(context) * 0.05,
                top: getDeviceHeight(context) * 0.025
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [BoxShadow(color: Colors.black, spreadRadius: 2.0, blurRadius: 10.0, blurStyle: BlurStyle.normal
                )]
              ),
              child: Column(
                children: [
                  // Number Details
                    Container(
                      width: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.5 : getDeviceWidth(context) * 0.8,
                      height: getDeviceWidth(context) > 480 ? getDeviceHeight(context) * 0.15 : getDeviceHeight(context) * 0.1,
                      child: Row(
                        children: [
                          // Number Country flag
                          Container(
                            width: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.05 : getDeviceWidth(context) * 0.1,
                            height: getDeviceWidth(context) > 480 ?  getDeviceHeight(context) * 0.1 : getDeviceHeight(context) * 0.05,
                            margin: EdgeInsets.only(
                              top: getDeviceWidth(context) > 480 ?  getDeviceHeight(context) * 0.01 : 0.0,
                              left: getDeviceWidth(context) * 0.05,
                              right: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.0 : getDeviceWidth(context) * 0.05
                            ),
                            decoration: BoxDecoration(
                              boxShadow: const [BoxShadow(color: Colors.black, blurStyle: BlurStyle.normal, blurRadius: 6.0, spreadRadius: 1.0)],
                              borderRadius: BorderRadius.circular(35),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(viewModel.numbers[index].numberCountryFlag)
                              )
                            ),
                          ),

                          // Number Text
                          Container(
                            width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.25 :getDeviceWidth(context) * 0.4,
                            height: getDeviceHeight(context) * 0.1,
                            margin: EdgeInsets.only(
                              right: getDeviceWidth(context) > 480 ? 0.0 : getDeviceWidth(context) * 0.02
                            ),
                            child: Column(
                              children: [
                                const Spacer(),
                                Text("${viewModel.numbers[index].numberCountryCode} ${viewModel.numbers[index].numberText}", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.05), textAlign: getDeviceWidth(context) > 480 ? TextAlign.left : TextAlign.center,),
                                Text("Sent :${viewModel.numbers[index].numberDate}", style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.015 : getDeviceWidth(context) * 0.025, fontWeight: FontWeight.bold), textAlign: TextAlign.left,),
                                const Spacer(),
                              ],
                            )
                          ),

                          // Number More Details
                          InkWell(
                            onTap : (){
                              viewModel.choosedNumberHistory = index;
                              viewModel.messageField.text = viewModel.numbers[index].numberMessage;
                              viewModel.numberField.text = viewModel.numbers[index].numberText;
                              viewModel.chooseDetailsScreen = true;
                              viewModel.notifyListeners();
                              },
                            child : Container(
                            width: getDeviceWidth(context) > 480 ? getDeviceWidth(context) * 0.06 : getDeviceWidth(context) * 0.1,
                            height: getDeviceHeight(context) * 0.1,
                            margin: EdgeInsets.only(
                              right: getDeviceWidth(context) > 480 ?  getDeviceWidth(context) * 0.02 : getDeviceWidth(context) * 0.08
                            ),
                            child: Icon(Icons.keyboard_arrow_up, size: getDeviceWidth(context) > 480 ? 45 : 56, color: Colors.black.withOpacity(0.6),),
                           ),
                          ),
                        ],
                      ),
                    ),

                  // Number Show More Details

                ],
              ),
             );
          },
      )
    );
  }

}