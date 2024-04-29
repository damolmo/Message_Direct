import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

class BasicConfig{

  BasicConfig({
    required this.flagName,
    required this.flagValue
});

  final String flagName;
  final String flagValue;

  static const basicConfigTable = """
    CREATE TABLE IF NOT EXISTS basicConfig(
      flagName TEXT PRIMARY KEY,
      flagValue TEXT);
  """;

  Map<String,dynamic> toMap() => {"flagName" : flagName, "flagValue" :  flagValue};
  factory BasicConfig.fromMap(Map<String,dynamic> map) =>
    BasicConfig(flagName: map["flagName"], flagValue: map["flagValue"]);

  static createBasicConfigTable() async {
    // A static method that creates the basic config table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.transaction((txn) => txn.execute(basicConfigTable));
    } else {
      final Database db = await openDatabase("direct.db");
      db.transaction((txn) => txn.execute(basicConfigTable));
    }
  }

  static insertConfigIntoTable(BasicConfig config) async {
    // A static method that inserts a new config into the table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.insert("basicConfig", config.toMap());
    } else {
      final Database db = await openDatabase("direct.db");
      db.insert("basicConfig", config.toMap());
    }
  }

  static updateExistingFlag(BasicConfig config) async {
    // A static method that updates existing flag value
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.update("basicConfig", config.toMap(), where: "flagName = ?", whereArgs: [config.flagName]);
    } else {
      final Database db = await openDatabase("direct.db");
      db.update("basicConfig", config.toMap(), where: "flagName = ?", whereArgs: [config.flagName]);
    }
  }

  static Future<List<BasicConfig>> retrieveRequestedFlag(String flagName) async {
    // A static method that retrieves user requested flag

    List<BasicConfig> rawToInstances(List<Map<String,dynamic>> rawConfigs, List<BasicConfig> configs){
      for (Map<String,dynamic> rawCofig in rawConfigs){
        configs.add(BasicConfig.fromMap(rawCofig));
      }
      return configs;
    }

    List<BasicConfig> configs = [];

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      configs = rawToInstances(await db.query("basicConfig", where: "flagName = ?", whereArgs: [flagName]), configs);
    } else {
      final Database db = await openDatabase("direct.db");
      configs =  rawToInstances(await db.query("basicConfig", where: "flagName = ?", whereArgs: [flagName]), configs);
    }
    return configs;
  }

}