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
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body : Stack(
        children: [

          // Background Theme
          BackgroundTheme(viewModel: viewModel,),

          // Logo Banner
          const DirectBanner(),

          // Switch Buttons
          SwitchButtons(viewModel: viewModel),

          // Telegram/WhatsApp action button
          if (viewModel.isDialerSelected)
            TelegramButton(viewModel: viewModel),


          // UserField
          if (viewModel.isDialerSelected)
            UserField(viewModel: viewModel),

          // Flag Selection
          if (viewModel.isFlagSelection)
            CodesList(viewModel: viewModel),
          // Numbers History

        ],
      )
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}