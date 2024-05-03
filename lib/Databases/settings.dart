import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

class Settings {

  Settings({
    required this.settingTitle,
    required this.settingSubtitle,
    required this.settingIcon,
});

  final String settingTitle;
  final String settingSubtitle;
  final int settingIcon;

  static const settingsTable = """
    CREATE TABLE IF NOT EXISTS settings(
      settingTitle TEXT PRIMARY KEY,
      settingSubtitle TEXT,
      settingIcon INTEGER
    );
  """;

  Map<String,dynamic> toMap() => {"settingTitle" : settingTitle, "settingSubtitle" : settingSubtitle, "settingIcon" : settingIcon};
  factory Settings.fromMap(Map<String,dynamic> map) =>
      Settings(
          settingTitle: map["settingTitle"],
          settingSubtitle: map["settingSubtitle"],
          settingIcon: map["settingIcon"]);

  static createSettingsTable() async {
    // A static method that creates the settings table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.transaction((txn) => txn.execute(settingsTable));
    } else {
      final Database db = await openDatabase("direct.db");
      db.transaction((txn) => txn.execute(settingsTable));
    }
  }

  static insertSettingIntoTable(Settings setting) async {
    // A static method that inserts a setting entry into the table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.insert("settings", setting.toMap());
    } else {
      final Database db = await openDatabase("direct.db");
      db.insert("settings", setting.toMap());
    }
  }

  static Future<List<Settings>> retrieveExistingSettings() async {
    // A static method that retrieves existing settings

    rawSettingToInstance(List<Map<String,dynamic>> rawSettings){
      List<Settings> settings = [];

      for (Map<String,dynamic> rawSetting in rawSettings){
        settings.add(Settings.fromMap(rawSetting));
      }
      return settings;
    }

    List<Settings> settings = [];

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      settings = rawSettingToInstance(await db.query("settings"));
    } else {
      final Database db = await openDatabase("direct.db");
      settings = rawSettingToInstance(await db.query("settings"));
    }

    return settings;
  }

}