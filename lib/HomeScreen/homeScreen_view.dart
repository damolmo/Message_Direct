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

    viewModel.checkDeviceWidth(context);

    return Scaffold(
      resizeToAvoidBottomInset : false,
      body : Stack(
        children: [

          // Background Theme
          BackgroundTheme(viewModel: viewModel,),

          // Logo Banner
          DirectBanner(viewModel: viewModel,),

          // Device Safe Width Alert
          if (!viewModel.isDeviceWidthSafe)
            SafeWidthAlert(viewModel: viewModel),

          // Switch Buttons
          if (viewModel.isDeviceWidthSafe)
          SwitchButtons(viewModel: viewModel),

          // Telegram/WhatsApp action button
          if (viewModel.isDialerSelected && viewModel.isDeviceWidthSafe)
            TelegramButton(viewModel: viewModel),


          // UserField
          if (viewModel.isDialerSelected && viewModel.isDeviceWidthSafe)
            UserField(viewModel: viewModel),

          // Flag Selection
          if (viewModel.isFlagSelection && viewModel.isDialerSelected && viewModel.isDeviceWidthSafe)
            CodesList(viewModel: viewModel),

          // Numbers History
          if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && viewModel.isDeviceWidthSafe)
            NumbersHistory(viewModel: viewModel),

          if (!viewModel.isDialerSelected && viewModel.numbers.isEmpty && viewModel.isDeviceWidthSafe)
            const NoHistoryMessage(),

          // Clear Numbers
          if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty && viewModel.isDeviceWidthSafe)
            RemoveHistoryButton(viewModel: viewModel),

        ],
      )
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}