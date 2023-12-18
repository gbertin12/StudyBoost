import 'package:flutter/material.dart';
import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void createDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = openDatabase(
        join(await getDatabasesPath(), 'studyboost_database.db'),
        onCreate:(db, version) async {
        await db.execute('''
            CREATE TABLE Event (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT,
                description TEXT,
                date TEXT,
                periodicity INTEGER,
                hourToStart REAL,
                hourToEnd REAL
            )
          ''');
        await db.execute('''
            CREATE TABLE Task (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT,
                description TEXT,
                isDone BOOLEAN,
                timeToComplete INTEGER
            )
          ''');
        await db.execute('''
            CREATE TABLE ToDoList (
                id INTEGER PRIMARY KEY AUTOINCREMENT,
                title TEXT,
                tasks TEXT
            )
          ''');
        },
        version: 1
    );
}