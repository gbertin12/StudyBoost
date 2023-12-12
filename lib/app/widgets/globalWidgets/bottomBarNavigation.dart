import 'package:flutter/material.dart';
import 'package:studyboost/settings/themes.dart';
import 'package:studyboost/app/view/calendarView.dart';
import 'package:studyboost/app/view/HomeView.dart';

class CustomBottomNavigationBar extends StatelessWidget{
  
  final int currentIndex;

  CustomBottomNavigationBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {

    return  BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Accueil',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today),
                    label: 'Calendrier',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add),
                    label: 'Ajouter',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.view_agenda_rounded),
                    label: 'Agenda',
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_add),
                    label: 'Outils',
                ),
                
            ],
            currentIndex: currentIndex,
            selectedItemColor: Colors.amber[800],
            onTap: (int index) => {
                print(index),
                if (index == 0 && currentIndex != 0) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeView()),
                    )
                }
                else if (index == 1 && currentIndex != 1) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarView()),
                    )
                }
                
            },
        );
    }
}
