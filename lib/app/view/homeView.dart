import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studyboost/app/widgets/globalWidgets/bottomBarNavigation.dart';
import 'package:studyboost/firebase_options.dart';
import 'package:table_calendar/table_calendar.dart';


class HomeView extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Accueil"),
                automaticallyImplyLeading: false,
            ),
            body: Text("Home"),
            bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 0),
        );
    }
}