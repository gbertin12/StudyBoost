import 'package:flutter/material.dart';
import 'package:studyboost/settings/themes.dart';
import 'package:studyboost/app/view/calendarView.dart';
import 'package:studyboost/app/view/HomeView.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  	final int currentIndex;

  	CustomBottomNavigationBar({required this.currentIndex});

  	@override
  	Widget build(BuildContext context) {
		return BottomNavigationBar(
	  	type: BottomNavigationBarType.fixed,
	  	items: _buildBottomNavigationBarItems(),
	  	currentIndex: currentIndex,
	  	selectedItemColor: Colors.amber[800],
	  	onTap: (int index) => _onTabTapped(context, index),
		);
  	}

  	List<BottomNavigationBarItem> _buildBottomNavigationBarItems() {
		return [
		  	_buildNavBarItem(Icons.home, 'Accueil'),
		  	_buildNavBarItem(Icons.calendar_today, 'Calendrier'),
		  	_buildNavBarItem(Icons.add, 'Ajouter'),
		  	_buildNavBarItem(Icons.view_agenda_rounded, 'Agenda'),
		  	_buildNavBarItem(Icons.bookmark_add, 'Outils'),
		];
  }

  BottomNavigationBarItem _buildNavBarItem(IconData icon, String label) {
	return BottomNavigationBarItem(
	  	icon: Icon(icon),
	  	label: label,
	);
  }

	// Redirect to the right page when the user tap on the bottom navigation bar
  	void _onTabTapped(BuildContext context, int index) {
		print(index);
		if (index != currentIndex) {
			List<Widget> views = [
				HomeView(), 
				CalendarView()
			];
			Navigator.push(
				context,
				MaterialPageRoute(builder: (context) => views[index]),
			);
		}
	}
}