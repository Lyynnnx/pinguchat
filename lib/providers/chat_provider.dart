import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinguchat/models/task.dart';

class TaskListNotifier extends StateNotifier<List<Task>> {
  TaskListNotifier()
      : super([
          Task(text: "Hello", isDone: false),
          Task(text: "World", isDone: true)
        ]);

  void addTask(Task task) {
    state = [task, ...state];
  }

  void removeTask(int index) {
    state = List.from(state)..removeAt(index);
  }

  void changeToDo(int index) {
    state = [
      ...state.sublist(0, index),
      Task(text: state[index].text, isDone: !state[index].isDone),
      ...state.sublist(index + 1, state.length),
    ];
  }
}

final taskListProvider = StateNotifierProvider<TaskListNotifier, List<Task>>(
    (ref) => TaskListNotifier());
