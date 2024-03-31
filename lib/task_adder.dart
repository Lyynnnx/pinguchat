import 'package:flutter/material.dart';

class TaskAdder extends StatefulWidget {
  TaskAdder({super.key});

  @override
  State<TaskAdder> createState() => _TaskAdderState();
}

class _TaskAdderState extends State<TaskAdder> {
  TextEditingController inputController = TextEditingController();

  bool _isDone = false;

  void submit() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            TextField(controller: inputController),
            SizedBox(
              height: 40,
            ),
            Switch(
                value: _isDone,
                onChanged: (value) {
                  setState(() {
                    _isDone = value;
                  });
                }),
            ElevatedButton(child: Text("Submit"), onPressed: submit),
          ],
        ),
      ),
    );
  }
}
