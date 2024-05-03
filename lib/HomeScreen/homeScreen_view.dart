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
        } else if (viewModel.chooseDetailsScreen) {
          viewModel.chooseDetailsScreen = false;
          viewModel.notifyListeners();
        }
      },
      canPop: viewModel.isFlagSelection || viewModel.chooseDetailsScreen ? false : true,
        child:Scaffold(
          resizeToAvoidBottomInset : false,
          body : Stack(
            children: [

              // Background Theme
              BackgroundTheme(viewModel: viewModel,),

              // Logo Banner
              DirectBanner(viewModel: viewModel,),

              // Custom App Bar
              CustomAppBar(viewModel: viewModel),

              // Device Safe Width Alert
              if (getDeviceWidth(context) > 480)
                SafeWidthAlert(viewModel: viewModel),

              // Switch Buttons
              if (!viewModel.chooseDetailsScreen && getDeviceWidth(context) <= 480)
              SwitchButtons(viewModel: viewModel),

              // Telegram/WhatsApp action button
              if (viewModel.isDialerSelected && getDeviceWidth(context) <= 480)
                TelegramButton(viewModel: viewModel),


              // UserField
              if (viewModel.isDialerSelected && getDeviceWidth(context) <= 480)
                UserField(viewModel: viewModel),

              if (viewModel.isDialerSelected && viewModel.numberField.text.isNotEmpty && !viewModel.isFlagSelection)
                MessageField(viewModel: viewModel),

              // Numbers History
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && !viewModel.chooseDetailsScreen && getDeviceWidth(context) <= 480)
                NumbersHistory(viewModel: viewModel),

              if (!viewModel.isDialerSelected && viewModel.numbers.isEmpty && getDeviceWidth(context) <= 480)
                const NoHistoryMessage(),

              // Clear Numbers
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && !viewModel.chooseDetailsScreen && getDeviceWidth(context) <= 480)
                RemoveHistoryButton(viewModel: viewModel),

              // Number Details
              if (viewModel.chooseDetailsScreen && !viewModel.isDialerSelected)
                NumberDetails(viewModel: viewModel),

              // Close Button
              if (viewModel.chooseDetailsScreen)
                CustomCloseButton(viewModel : viewModel),

              // Flag Selection
              if (viewModel.isFlagSelection && viewModel.isDialerSelected && getDeviceWidth(context) <= 480 || viewModel.isHistoryEdited && viewModel.isFlagSelection  && getDeviceWidth(context) <= 480)
                CodesList(viewModel: viewModel),

            ],
          )
      ),
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}