import 'package:flutter/material.dart';
import '../exports.dart';

class SettingsData {

  static Map<String,dynamic> settingsMap = {
    "Appearance" : {
      "settingSubtitle" : "Customize the app interface",
      "settingIcon" : Icons.format_paint_outlined.codePoint
    },

    "Export Data" : {
      "settingSubtitle" : "Export your contacts history",
      "settingIcon" : Icons.file_download_outlined.codePoint
    },

    "Import Data" : {
      "settingSubtitle" : "Import your contacts history",
      "settingIcon" : Icons.file_upload_outlined.codePoint
    },

    "About App" : {
      "settingSubtitle" : "More details about this app",
      "settingIcon" : Icons.info_outline.codePoint
    },
  };

  static insertSettingEntries() async {
    // A method that inserts all settings entries
    Settings.createSettingsTable(); // To be executed once

    for (String setting in settingsMap.keys){
      Settings.insertSettingIntoTable(
        Settings(
            settingTitle: setting,
            settingSubtitle: settingsMap[setting]["settingSubtitle"],
            settingIcon: settingsMap[setting]["settingIcon"])
      );
    }
  }

}