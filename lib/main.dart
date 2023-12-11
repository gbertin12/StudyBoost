import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:studyboost/firebase_options.dart';
import 'package:table_calendar/table_calendar.dart';

Future<void> main() async {
	WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform
	);
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
	  home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
			appBar: AppBar(title: Text(widget.title)),
			body: Content(),
		);
  }

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
}
