import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pinguchat/models/task.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {

    List<Task> tasks=[Task(isDone:true, text:"Hello", id:"1"), Task(isDone:false, text:"World", id:"2")];



    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Pisya"),
        actions: [IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            Navigator.pushNamed(context, '/taskAdder');
          },
        ),],
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (context, index) {
          return  ListTile(
            title: (Text(tasks[index].text)),
            trailing: tasks[index].isDone ? const Icon(Icons.check_box) : const Icon(Icons.check_box_outline_blank),
            onTap:(){
              
            },
          );
        }, itemCount: tasks.length,),
        
      ),
      
    );
  }
}
