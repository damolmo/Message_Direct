import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import '../exports.dart';

class HomeScreenView extends StackedView<HomeScreenModel>{
  @override
  const HomeScreenView({
    super.key
});

  @override
  Widget builder(
      BuildContext context,
      HomeScreenModel viewModel,
      Widget? child
      ){

    return PopScope(
      onPopInvoked: (pop){
        if (viewModel.isFlagSelection){
          viewModel.isFlagSelection = false;
          viewModel.notifyListeners();
        }
      },
      canPop: viewModel.isFlagSelection ? false : true,
        child:Scaffold(
          resizeToAvoidBottomInset : false,
          body : Stack(
            children: [

              // Background Theme
              BackgroundTheme(viewModel: viewModel,),

              // Logo Banner
              DirectBanner(viewModel: viewModel,),

              // Device Safe Width Alert
              if (getDeviceWidth(context) > 480)
                SafeWidthAlert(viewModel: viewModel),

              // Switch Buttons
              if (getDeviceWidth(context) <= 480)
              SwitchButtons(viewModel: viewModel),

              // Telegram/WhatsApp action button
              if (viewModel.isDialerSelected && getDeviceWidth(context) <= 480)
                TelegramButton(viewModel: viewModel),


              // UserField
              if (viewModel.isDialerSelected && getDeviceWidth(context) <= 480)
                UserField(viewModel: viewModel),

              if (viewModel.isDialerSelected && viewModel.numberField.text.isNotEmpty && !viewModel.isFlagSelection)
                MessageField(viewModel: viewModel),

              // Flag Selection
              if (viewModel.isFlagSelection && viewModel.isDialerSelected && getDeviceWidth(context) <= 480)
                CodesList(viewModel: viewModel),

              // Numbers History
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && getDeviceWidth(context) <= 480)
                NumbersHistory(viewModel: viewModel),

              if (!viewModel.isDialerSelected && viewModel.numbers.isEmpty && getDeviceWidth(context) <= 480)
                const NoHistoryMessage(),

              // Clear Numbers
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && getDeviceWidth(context) <= 480)
                RemoveHistoryButton(viewModel: viewModel),

            ],
          )
      ),
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}