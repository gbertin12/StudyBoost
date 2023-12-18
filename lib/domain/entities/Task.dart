class Task {
    final int       id;
    final String    title;
    final String    description;
    final bool      isDone;
    final int       timeToComplete;

    const Task({
        required this.id,
        required this.title,
        required this.description,
        required this.isDone,
        this.timeToComplete = 0,
    });

    // Convert a Task into a Map
    Map<String, dynamic> toMap() {
        return {
            'id': id,
            'title': title,
            'description': description,
            'isDone': isDone,
            'timeToComplete': timeToComplete,
        };
    }

    @override
    String toString() {
        return 'Task{id: $id, title: $title, description: $description, isDone: $isDone, timeToComplete: $timeToComplete}';
    }
}