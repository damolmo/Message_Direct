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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenView() ,
    );
  }
}