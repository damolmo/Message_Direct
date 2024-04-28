// Global variables to be used across all the app

import 'package:flutter/cupertino.dart';

double getDeviceHeight(BuildContext context) => MediaQuery.of(context).size.height;
double getDeviceWidth(BuildContext context) => MediaQuery.of(context).size.width;
Color whatsAppBackgroundColor = Color(int.parse("FF04c886", radix: 16));
Color telegramBackgroundColor = Color(int.parse("FF0088CC", radix: 16));