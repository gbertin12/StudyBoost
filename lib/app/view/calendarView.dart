import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studyboost/app/widgets/globalWidgets/bottomBarNavigation.dart';
import 'package:studyboost/firebase_options.dart';
import 'package:table_calendar/table_calendar.dart';


// class _MyHomePageState extends State<MyHomePage> {
// 	@override
// 	Widget build(BuildContext context) {
// 		return Scaffold(
// 			appBar: AppBar(title: Text(widget.title)),
// 			body: Content(),
// 		);
//   }
Widget Content() {
		return Column(
		children: [
			Container(
				child: TableCalendar(
					headerStyle: const HeaderStyle(
						titleCentered: true,
						formatButtonVisible: false,
						leftChevronIcon: Icon(Icons.chevron_left),
						rightChevronIcon: Icon(Icons.chevron_right),
					),
					calendarStyle: const CalendarStyle(
						weekendTextStyle: TextStyle(color: Colors.red),
					),
					firstDay: DateTime.utc(2010, 10, 16),
					lastDay: DateTime.utc(2030, 3, 14),
					focusedDay: DateTime.now(),
				),
			)
		]
		);
	}

class CalendarView extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Calendrier"),
                automaticallyImplyLeading: false,
            ),
            body: Content(),
            bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1,),
        );
    }
}