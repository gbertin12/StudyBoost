import 'package:flutter/material.dart';
import 'package:studyboost/app/widgets/globalWidgets/bottomBarNavigation.dart';
import 'package:table_calendar/table_calendar.dart';

class Event {
	final String title;

	const Event({
		required this.title
	});
}

class CalendarView extends StatefulWidget {

  	@override
  	_CalendarViewState createState() => _CalendarViewState();
}

class _CalendarViewState extends State<CalendarView> {
	
	DateTime today = DateTime.now();
	DateTime _selectedDay = DateTime.now();
	Map<DateTime, List<Event>> events = {};
	TextEditingController _eventController = TextEditingController();
	late final ValueNotifier<List<Event>> _selectedEvents;

	@override
  	void initState() {
		super.initState();
		_selectedDay = today;
		_selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
  	}

	@override
	void dispose() {
		super.dispose();
	}

	void _onDaySelected(DateTime day, DateTime focusedDay) {
		setState(() {
			_selectedDay = day;
			_selectedEvents.value = _getEventsForDay(_selectedDay);
		});
	}

	List<Event> _getEventsForDay(DateTime day) {
		return events[day] ?? [];
	}

	@override
  	Widget build(BuildContext context) {
		return Scaffold(
	  		appBar: AppBar(
				title: const Text("Calendrier"),
				automaticallyImplyLeading: false,
	  		),
			floatingActionButton: FloatingActionButton(
				onPressed: () {
					showDialog(
						context: context, 
						builder: (context) {
							return AlertDialog(
								scrollable: true,
								title: Text("Event Name"),
								content: Padding (
									padding: EdgeInsets.all(8),
									child: TextField(
										controller: _eventController,
									)
								),
								actions: [
									ElevatedButton(
										onPressed: () {
											events.addAll({
												_selectedDay: [
													Event(title: _eventController.text)]
											});
											Navigator.of(context).pop();
											_selectedEvents.value = _getEventsForDay(_selectedDay);
										}, 
										child: const Text("Save")
									)
								],
							);
						}
					);
				},
			),
	  		body: Calendar(),
	  		bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
		);
  	}

	Widget Calendar() {
		return Column(
			children: [
				Text("Selected day: " + today.toString().split(" ")[0]),
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
						selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
						firstDay: DateTime.utc(2010, 10, 16),
						lastDay: DateTime.utc(2030, 3, 14),
						eventLoader: _getEventsForDay,
						focusedDay: today,
						startingDayOfWeek: StartingDayOfWeek.monday,
						onDaySelected: (selectedDay, focusedDay) {
            				_onDaySelected(selectedDay, focusedDay);
          				},
					),
				),
				SizedBox(height: 8,),
				Expanded (
					child: ValueListenableBuilder<List<Event>>(
						valueListenable: _selectedEvents,
						builder: (context, value, _) {
						return ListView.builder(
							itemCount: value.length, 
							itemBuilder: (context, index) {
								return Container(
									decoration: BoxDecoration(
										border: Border.all(width: 0.8),
										borderRadius: BorderRadius.circular(12),
									),
									margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
									child: ListTile(
										title: Text(value[index].title),
										onTap: () => print('${value[index].title} tapped!'),
									),
								);
							}
						);
					})
				)
			],
		);
	}
}