import 'package:flutter/material.dart';
import 'package:pinguchat/task_adder.dart';
import 'package:pinguchat/window.dart';

void main(){
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes:{
        '/': (context)=> ForumScreen(),
        '/taskAdder': (context) => TaskAdder(),
      },
    );
  }
}