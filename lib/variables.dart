// Global variables to be used across all the app

import 'package:flutter/cupertino.dart';

// App Build Data
const String appVersion  = "v3.2.1";
const String appUpdateTime = "2024-05-17 09:00:00";
const String appDeveloper = "Damolmo";


double getDeviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getDeviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
Color whatsAppBackgroundColor = Color(int.parse("FF04c886", radix: 16));
Color telegramBackgroundColor = Color(int.parse("FF0088CC", radix: 16));