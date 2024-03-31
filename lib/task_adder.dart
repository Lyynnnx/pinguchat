import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pinguchat/models/task.dart';
import 'package:pinguchat/providers/chat_provider.dart';

class TaskAdder extends ConsumerStatefulWidget {
  const TaskAdder({super.key});

  @override
  ConsumerState<TaskAdder> createState() => _TaskAdderState();
}

class _TaskAdderState extends ConsumerState<TaskAdder> {
  TextEditingController inputController = TextEditingController();

  bool _isDone = false;

  void submit() {
    final task = Task(text: inputController.text, isDone: _isDone);
    ref.read(taskListProvider.notifier).addTask(task);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            TextField(controller: inputController),
            const SizedBox(
              height: 40,
            ),
            Switch(
                value: _isDone,
                onChanged: (value) {
                  setState(() {
                    _isDone = value;
                  });
                }),
            ElevatedButton(onPressed: submit, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
