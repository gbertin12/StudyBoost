
class Event {
    final int       id;
    final String    title;
    final String    description;
    final DateTime  date;
    final int       periodicity;
    final double    hourToStart;
    final double    hourToEnd;

    const Event({
        required this.id,
        required this.title,
        required this.description,
        required this.date,
        this.periodicity = 0,
        this.hourToStart = 50,
        this.hourToEnd = 50,
    });

    // Convert a Event into a Map
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'title': title,
            'description': description,
            'date': date.millisecondsSinceEpoch,
            'periodicity': periodicity,
            'hourToStart': hourToStart,
            'hourToEnd': hourToEnd,
        };
    }

    @override
    String toString() {
        return 'Event{id: $id, title: $title, description: $description, date: $date, periodicity: $periodicity, hourToStart: $hourToStart, hourToEnd: $hourToEnd}';
    }

}
