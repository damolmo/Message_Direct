import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

class CountryCodes {

  CountryCodes({
    required this.countryCode,
    required this.countryFlag,
    required this.countryAbreviation
});

  final String countryCode;
  final String countryFlag;
  final String countryAbreviation;

  static const countryCodeTable = """
    CREATE TABLE IF NOT EXISTS countryCodes(
      ID TEXT PRIMARY KEY,
      countryCode TEXT,
      countryFlag TEXT,
      countryAbreviation TEXT
    );
  """;

  factory CountryCodes.fromMap(Map<String,dynamic> map) => CountryCodes(countryCode: map["countryCode"], countryFlag: map["countryFlag"], countryAbreviation: map["countryAbreviation"]);
  Map<String,dynamic> toMap() => {"countryCode" : countryCode, "countryFlag" : countryFlag, "countryAbreviation" :  countryAbreviation};

  static createCountryCodeTable() async {
    // A static method that creates the country codes table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.transaction((txn) => txn.execute(countryCodeTable));
    } else {
      final Database db = await openDatabase("direct.db");
      db.transaction((txn) => txn.execute(countryCodeTable));
    }
  }

  static insertCountryCodeIntoTable(CountryCodes code) async {
    // A static method that insert a new country code
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.insert("countryCodes", code.toMap());
    } else {
      final Database db = await openDatabase("direct.db");
      db.insert("countryCodes", code.toMap());
    }
  }

  static Future<List<CountryCodes>> retrieveCurrentCodes() async {
    // A static method that retrieves existing country codes

    List<CountryCodes> rawToInstance(List<Map<String,dynamic>> rawCodes, List<CountryCodes> codes) {
      for (Map<String,dynamic> rawCode in rawCodes){
        codes.add(CountryCodes.fromMap(rawCode));
      }
      return codes;
    }

    List<CountryCodes> codes = [];

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      codes = rawToInstance(await db.query("countryCodes"), codes);
    } else {
      final Database db = await openDatabase("direct.db");
      codes = rawToInstance(await db.query("countryCodes"), codes);
    }
    return codes;
  }




}