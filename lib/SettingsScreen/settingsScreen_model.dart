import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stacked/stacked.dart';
import 'package:url_launcher/url_launcher.dart';
import '../exports.dart';

class SettingsScreenModel extends HomeScreenModel implements Initialisable{


  List<Settings> settings  = [];
  List<dynamic> rawContacts = [];
  List<NumberHistory> numbers  = [];

  @override
  void initialise(){
    getCurrentSettings();
    getRawContacts();
    super.isSettingsScreen = true;
    super.notifyListeners();
  }

  void getCurrentSettings() async {
    // A method that retrieves and inserts settings
    try {
      settings = await Settings.retrieveExistingSettings();
      notifyListeners();
    } catch (e){
      SettingsData.insertSettingEntries();
      settings = await Settings.retrieveExistingSettings();
      notifyListeners();
    }
  }

  void getRawContacts() async {
    // A method that allow us to get rawContacts
    try {
      numbers = await NumberHistory.retrieveExistingNumbers();
      notifyListeners();
    } catch (e){
      // Nothing to do
    }
  }

  void addRawContacts() async {
    // Format instances to raw

    for (NumberHistory number in numbers){
      rawContacts.add({"numberText" : number.numberText, "numberMessage" :  number.numberMessage, "numberCountryCode" : number.numberCountryCode, "numberCountryFlag" :  number.numberCountryFlag, "numberDate" : number.numberDate});
    }
  }


  void exportData(BuildContext context) async {
    // A method that allow us to export all contacts history
    // Get raw data
    addRawContacts();

    if (numbers.isNotEmpty && !kIsWeb){
      // First, create a temp dir
      Directory tempDir = Directory('/storage/emulated/0/Download');
      notifyListeners();

      // Second, create a file in the new location
      File tempFile = File("${tempDir.path}/contacts_${DateTime.now().year}_${DateTime.now().month}_${DateTime.now().day}_${DateTime.now().second}_${DateTime.now().minute}_${DateTime.now().hour}.txt");

      var data = jsonEncode(rawContacts);
      tempFile.writeAsStringSync(data);

      // Notify User about download completed
      notifyUser("File Downloaded at\n${tempFile.path}", context);


    } else if (numbers.isNotEmpty && kIsWeb) {

      // Get File and data
      var data = json.encode(rawContacts);
      List<int> bytes = utf8.encode(data);

      // Notify Users about success
      notifyUser("Your started to download", context);

      // Download file
      launchUrl(Uri.parse("data:application/octet-stream;base64,${base64Encode(bytes)}"));
    } else {
      notifyUser("Your contacts history is empty\nNothing to export", context);
    }
  }

  void importData(BuildContext context) async {
    // A method that imports data into the database

    // Allow user to pick a file
    if (!kIsWeb){
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);

      // Read data from file
      File tempFile = File(result!.files.single.path!);
      var data = await tempFile.readAsString();
      rawContacts = jsonDecode(data) as List<dynamic>;
      notifyListeners();
    } else {
      FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: false);
      List<int> bytes  = result?.files.first.bytes as List<int>;
      var data = utf8.decode(bytes);
      rawContacts = json.decode(data);
      notifyListeners();
    }


    // Insert Entries
    insertNumbers();

    // Notify users
    notifyUser("Your Data has been restored\nHave a nice day!", context);

    // Catch data
    getRawContacts();
  }

  void insertNumbers() async {
    // A method that allow us to iterate all instances and insert them

    for (Map<String,dynamic> rawNumber in rawContacts){
      NumberHistory.insertNumberIntoTable(
        NumberHistory(
            numberText: rawNumber["numberText"],
            numberCountryCode: rawNumber["numberCountryCode"],
            numberCountryFlag: rawNumber["numberCountryFlag"],
            numberDate: rawNumber["numberDate"],
            numberMessage: rawNumber["numberMessage"])
      );

    }
  }

  void notifyUser(String message, BuildContext context) async {
    // A method that notifies users about relevant changes
    SnackBar snack = SnackBar(content: Text(message, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: getDeviceWidth(context) * 0.05,), textAlign: TextAlign.center,), behavior: SnackBarBehavior.floating,);
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }

}