import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:message_direct/Data/codesData.dart';
import 'package:stacked/stacked.dart';
import '../exports.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenModel extends BaseViewModel implements Initialisable{

  List<CountryCodes> codes = [];
  List<NumberHistory> numbers  = [];
  bool isDialerSelected = true;
  bool isNumberHistoryEmpty = true;
  bool isWhatsAppUrl = true;
  bool isKeyboardEnabled = false;
  bool isFlagSelection = false;
  TextEditingController numberField = TextEditingController(text: "");
  int choosedCountryCode = 0;


  @override
  void initialise(){
    getCountryCodes();
    getNumbersHistory();
  }

  void getCountryCodes() async {
    // A method that retrieves existing country codes
    // Inserts new ones if missing
    try {
      codes = await CountryCodes.retrieveCurrentCodes();
      notifyListeners();
    } catch (e){
      CodesData.insertCodesValues();
      codes = await CountryCodes.retrieveCurrentCodes();
      notifyListeners();
    }
  }

  double getKeyBoardTop(BuildContext context)  {
    if (isKeyboardEnabled){
      return getDeviceHeight(context) * 0.6;
    } else {
      return getDeviceHeight(context) * 0.72;
    }
  }


  double getKeyBoardBottom(BuildContext context) {
    if (isKeyboardEnabled){
      return getDeviceHeight(context) * 0.3;
    } else {
      return getDeviceHeight(context) * 0.1;
    }
  }

  void getNumbersHistory() async {
    // A method that gets the numbers history
    try {
      numbers = await NumberHistory.retrieveExistingNumbers();
      notifyListeners();
    } catch (e){
      isNumberHistoryEmpty = true;
      notifyListeners();
    }
  }

  Uri getWhatsAppUri() =>
      Uri(
        scheme: 'https',
        host: 'wa.me',
        path: "${codes[choosedCountryCode].countryCode}${numberField.text}"
      );

  Uri getTelegramUri() =>
      Uri(
          scheme: 'https',
          host: 't.me',
          path: "${codes[choosedCountryCode].countryCode}${numberField.text}"
      );

  void openNumberChat() async {
    // A method that opens a whatsapp requested number
    launchUrl(isWhatsAppUrl ? getWhatsAppUri() : getTelegramUri(), mode: LaunchMode.externalNonBrowserApplication);
  }

  Color getAppColor() {
    if (isWhatsAppUrl){
      return whatsAppBackgroundColor;
    } else {
      return telegramBackgroundColor;
    }
  }

}