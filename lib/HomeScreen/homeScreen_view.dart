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
          if (viewModel.isFlagSelection && viewModel.isDialerSelected)
            CodesList(viewModel: viewModel),

          // Numbers History
          if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty)
            NumbersHistory(viewModel: viewModel),

          if (!viewModel.isDialerSelected && viewModel.numbers.isEmpty)
            const NoHistoryMessage(),

          // Clear Numbers
          if (!viewModel.isDialerSelected && viewModel.numbers.isNotEmpty)
            RemoveHistoryButton(viewModel: viewModel),

        ],
      )
    );
  }

  @override
  HomeScreenModel viewModelBuilder(BuildContext context) => HomeScreenModel();

}