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
              width: getDeviceWidth(context) * 0.79,
              height: getDeviceHeight(context) * 0.1,
              margin: EdgeInsets.only(
                left: getDeviceWidth(context) * 0.01,
                right: getDeviceWidth(context) * 0.01,
                top: getDeviceHeight(context) * 0.025
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [BoxShadow(color: Colors.black, blurStyle: BlurStyle.normal, blurRadius: 6.0, spreadRadius: 0.2)]
              ),
              child: ListTile(
                leading: Container(
                  width: getDeviceWidth(context) * 0.1,
                  height: getDeviceHeight(context) * 0.1,
                  margin: EdgeInsets.only(
                    left: getDeviceWidth(context) * 0.05,
                    right: getDeviceWidth(context) * 0.025,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage(viewModel.numbers[index].numberCountryFlag)
                    )
                  ),
                ),
                title: Text("${viewModel.numbers[index].numberCountryCode} ${viewModel.numbers[index].numberText}", style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.04, fontWeight: FontWeight.bold),),
                subtitle: Text(viewModel.numbers[index].numberDate, style: TextStyle(color: Colors.black, fontSize: getDeviceWidth(context) * 0.03), ),
                trailing: Container(
                  width: getDeviceWidth(context) * 0.1,
                  height: getDeviceHeight(context) * 0.1,
                  margin: EdgeInsets.only(
                      left: getDeviceWidth(context) * 0.05,
                      right: getDeviceWidth(context) * 0.05
                  ),
                  child: IconButton(
                    onPressed : (){
                      viewModel.choosedNumberHistory = index;
                      viewModel.notifyListeners();
                      viewModel.openNumberChat();
                    },
                    icon: const Icon(Icons.send, color: Colors.blueAccent, size: 40,),
                  ),

                ),
              ),

             );
          },
      )
    );
  }

}