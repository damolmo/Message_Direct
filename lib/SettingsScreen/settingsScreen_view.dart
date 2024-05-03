import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';

class SettingsScreenView extends StackedView<SettingsScreenModel>{
  @override
  const SettingsScreenView({
    super.key
});

  @override
  Widget builder(
      BuildContext context,
      SettingsScreenModel viewModel,
      Widget? child
      ){
    return Scaffold(
      body : Stack(
        children: [

          // Background Theme
          BackgroundTheme(viewModel: viewModel),

          // Banner
          SettingsBanner(viewModel: viewModel),

          // Menu Options
          SettingsMenu(viewModel: viewModel),
        ],
      )
    );
  }

  @override
  SettingsScreenModel viewModelBuilder(BuildContext context) => SettingsScreenModel();

}