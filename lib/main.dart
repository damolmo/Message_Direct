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
    SystemChrome.setEnabledSystemUIMode (SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreenView() ,
    );
  }
}