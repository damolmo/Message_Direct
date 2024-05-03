import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'exports.dart';

void main() => runApp(const DirectApp());

class DirectApp extends StatelessWidget{
  @override
  const DirectApp({
    super.key
});

  @override
  Widget build(BuildContext context){
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: []);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreenView() ,
      routes :  {
        "settings" : (_) => const SettingsScreenView(),
        "about" : (_) => const AboutAppScreenView()
      }
    );
  }
}