import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinguchat/models/task.dart';
import 'package:pinguchat/providers/chat_provider.dart';

class ForumScreen extends ConsumerStatefulWidget {
  const ForumScreen({super.key});

  @override
  ConsumerState<ForumScreen> createState() => _ForumScreenState();
}

class _ForumScreenState extends ConsumerState<ForumScreen> {
  void changeToDo(WidgetRef ref, int index) {
    ref.read(taskListProvider.notifier).changeToDo(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pisya"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, '/taskAdder');
            },
          ),
        ],
      ),
      body: tasks.isEmpty
          ? const Center(
              child: Text("add some tasks"),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Dismissible(
                  background: Container(
                      color: Colors.green, child: const Icon(Icons.delete)),
                  key: Key(tasks[index].id),
                  onDismissed: (direction) {
                    ref.read(taskListProvider.notifier).removeTask(index);
                  },
                  child: ListTile(
                    title: (Text(tasks[index].text)),
                    trailing: tasks[index].isDone
                        ? const Icon(Icons.check_box)
                        : const Icon(Icons.check_box_outline_blank),
                    onTap: () {
                      changeToDo(ref, index);
                    },
                  ),
                );
              },
              itemCount: tasks.length,
            ),
    );
  }
}
