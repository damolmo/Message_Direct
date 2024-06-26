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
          viewModel.getCountryCodes();
          viewModel.codeField.text = "";
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
              //if (getDeviceWidth(context) > 480)
                //SafeWidthAlert(viewModel: viewModel),

              // Switch Buttons
              if (!viewModel.chooseDetailsScreen)
              SwitchButtons(viewModel: viewModel),

              // Telegram/WhatsApp action button
              if (viewModel.isDialerSelected)
                TelegramButton(viewModel: viewModel),


              // UserField
              if (viewModel.isDialerSelected)
                UserField(viewModel: viewModel),

              if (viewModel.isDialerSelected && viewModel.numberField.text.isNotEmpty && !viewModel.isFlagSelection)
                MessageField(viewModel: viewModel),

              // Numbers History
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && !viewModel.chooseDetailsScreen)
                NumbersHistory(viewModel: viewModel),

              if (!viewModel.isDialerSelected && viewModel.numbers.isEmpty)
                const NoHistoryMessage(),

              // Clear Numbers
              if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && !viewModel.chooseDetailsScreen)
                RemoveHistoryButton(viewModel: viewModel),

              // Number Details
              if (viewModel.chooseDetailsScreen && !viewModel.isDialerSelected)
                NumberDetails(viewModel: viewModel),

              // Close Button
              if (viewModel.chooseDetailsScreen)
                CustomCloseButton(viewModel : viewModel),

              // Flag Selection
              if (viewModel.isFlagSelection && viewModel.isDialerSelected || viewModel.isHistoryEdited && viewModel.isFlagSelection)
                CodesList(viewModel: viewModel),

              // Search Flag
              if (viewModel.isFlagSelection)
              SearchCodeField(viewModel: viewModel),

            ],
          )
      ),
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}