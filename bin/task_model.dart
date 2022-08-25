import 'task_status.dart';

class TaskModel {
  final int id;
  final String name;
  final String caption;
  final DateTime deadline;
  final double labor;
  final int priority;
  final String status;
  final List<int> subtasksIds;
  final List<int> dependsIds;

  TaskModel({
    required this.id,
    required this.name,
    required this.deadline,
    this.labor = 0,
    this.priority = 0,
    this.caption = "",
    this.status = TaskStatus.isNew,
    this.subtasksIds = const <int>[],
    this.dependsIds = const <int>[],
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "caption": caption,
        "deadline": deadline.toString(),
        "labor": labor,
        "priority": priority,
      };
}
