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


  void changeToDo(WidgetRef ref, int index){
    ref.read(TaskListProvider.notifier).changeToDo(index);
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    List<Task> tasks = ref.watch(TaskListProvider);

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
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              background: Container(color:Colors.green, child: Icon(Icons.delete)),
              key: Key(tasks[index].id),
              onDismissed: (direction ){
              ref.read(TaskListProvider.notifier).removeTask(index);
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
      ),
    );
  }
}
