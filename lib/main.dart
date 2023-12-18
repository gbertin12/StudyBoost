import 'package:flutter/material.dart';

import 'package:studyboost/app/widgets/globalWidgets/bottomBarNavigation.dart';
import 'package:studyboost/domain/gateway/databaseGateway.dart';

import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
void main() async {
    createDatabase();
    // String path = join(await getDatabasesPath(), 'studyboost_database.db');

    // bool databaseExists = await databaseFactory.databaseExists(path);
    // if (!databaseExists) {
    //     createDatabase();
    // }
	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
	return MaterialApp(
	    title: 'Flutter Demo',
	    theme: ThemeData(
		    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
		    useMaterial3: true,
	    ),
	    home: const MyHomePage(title: 'Calendar'),
	);
    }
}

class MyHomePage extends StatefulWidget {
	const MyHomePage({super.key, required this.title});

	final String title;

	@override
	State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
                title: Text(widget.title),
                automaticallyImplyLeading: false,
            ),
			body: Text("Hello World"),
            bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0,),
		);
    }	
}
