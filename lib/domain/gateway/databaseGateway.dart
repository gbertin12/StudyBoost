import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = openDatabase(
        join(await getDatabasesPath(), 'studyboost_database.db'),
        onCreate:(db, version) {
            return db.execute(
                "CREATE TABLE events(id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, description TEXT)"
            );
        },
        version: 1
    );
    return database;
}