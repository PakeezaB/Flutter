import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(
    typeId: 0) //used to define the Hive type and assign it a unique type ID
class Task extends HiveObject //save(), delete(), and refresh() methods
{
  @HiveField(0)
  String title;

  @HiveField(1)
  String details;

  @HiveField(2)
  bool isCompleted;

  Task({required this.title, required this.details, this.isCompleted = false});
}
