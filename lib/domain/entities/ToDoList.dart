import 'Task.dart';

class ToDoList {
    final int id;
    final String title;
    final List<Task> tasks;

    const ToDoList({
        required this.id,
        required this.title,
        this.tasks = const [],
    });
}