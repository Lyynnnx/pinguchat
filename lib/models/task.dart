import 'package:uuid/uuid.dart';

class Task{
  Task({
    required this.text,
    required this.isDone,
    String? id,
  }): id = id ?? const Uuid().v4();
  final String text;
   bool isDone;
  final String id;

  
}
