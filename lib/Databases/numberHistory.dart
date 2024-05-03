import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:flutter/foundation.dart';

class NumberHistory{

  NumberHistory({
    required this.numberText,
    required this.numberCountryCode,
    required this.numberCountryFlag,
    required this.numberDate,
    required this.numberMessage,
});

  final String numberText;
  final String numberCountryCode;
  final String numberCountryFlag;
  final String numberDate;
  final String numberMessage;

  static const numberHistoryTable = """
    CREATE TABLE IF NOT EXISTS numberHistory(
      ID TEXT PRIMARY KEY,
      numberText TEXT,
      numberCountryCode TEXT,
      numberCountryFlag TEXT,
      numberDate TEXT,
      numberMessage TEXT,
      FOREIGN KEY(numberCountryCode) REFERENCES countryCodes(countryCode),
      FOREIGN KEY(numberCountryFlag) REFERENCES countryCodes(countryFlag));
  """;

  Map<String,dynamic> toMap() => {"numberText" :  numberText, "numberCountryCode" :  numberCountryCode, "numberCountryFlag" : numberCountryFlag, "numberDate" : numberDate, "numberMessage" : numberMessage};
  factory NumberHistory.fromMap(Map<String,dynamic> map) => NumberHistory(numberText: map["numberText"], numberCountryCode: map["numberCountryCode"], numberCountryFlag: map["numberCountryFlag"], numberDate: map["numberDate"], numberMessage : map["numberMessage"]);

  static createNumberHistoryTable() async {
    // A method that creates the number history table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.transaction((txn) => txn.execute(numberHistoryTable));
    } else {
      final Database db = await openDatabase("direct.db");
      db.transaction((txn) => txn.execute(numberHistoryTable));
    }
  }

  static dropNumberHistoryTable() async {
    // A Static method that drops and creates the table

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.transaction((txn) => txn.execute("DROP TABLE IF EXISTS numberHistory"));
    } else {
      final Database db = await openDatabase("direct.db");
      db.transaction((txn) => txn.execute("DROP TABLE IF EXISTS numberHistory"));
    }
    createNumberHistoryTable();
  }

  static insertNumberIntoTable(NumberHistory number) async {
    // A static method that inserts a number into the table
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.insert("numberHistory", number.toMap());
    } else {
      final Database db = await openDatabase("direct.db");
      db.insert("numberHistory", number.toMap());
    }
  }

  static updateExistingNumber(NumberHistory updatedNumber) async {
    // A static method that allow us to modify an existing number

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.update("numberHistory", updatedNumber.toMap(), where: "numberDate = ?", whereArgs: [updatedNumber.numberDate]);
    } else {
      final Database db = await openDatabase("direct.db");
      db.update("numberHistory", updatedNumber.toMap(), where: "numberDate = ?", whereArgs: [updatedNumber.numberDate]);
    }

  }

  static removeExistingHistory(NumberHistory number) async {
    // A static method that removes history numbers
    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      db.delete("numberHistory", where: "numberDate = ?", whereArgs: [number.numberDate]);
    } else {
      final Database db = await openDatabase("direct.db");
      db.delete("numberHistory", where: "numberDate = ?", whereArgs: [number.numberDate]);
    }

  }

  static Future<List<NumberHistory>> retrieveExistingNumbers() async {
    // A static method that retrieves all existing numbers in db
    rawtoInstance(List<Map<String,dynamic>> rawNumbers, List<NumberHistory> numbers) {
      for (Map<String,dynamic> rawNumber in rawNumbers){
        numbers.add(NumberHistory.fromMap(rawNumber));
      }

      return numbers;
    }

    List<NumberHistory> numbers = [];

    if (kIsWeb){
      final Database db = await databaseFactoryFfiWeb.openDatabase("direct.db");
      numbers = rawtoInstance(await db.query("numberHistory"), numbers);
    } else {
      final Database db = await openDatabase("direct.db");
      numbers = rawtoInstance(await db.query("numberHistory"), numbers);
    }
    return numbers;
  }




}