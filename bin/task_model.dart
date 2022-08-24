import 'task_status.dart';

class Task {
  final int id;
  final int? parentId;
  final String name;
  final String? caption;
  final DateTime deadline;
  final double labor;
  final int priority;
  final String status;
  final List<int>? subtasksIds;
  final List<int>? dependsIds;

  Task({
    required this.id,
    required this.name,
    required this.deadline,
    required this.labor,
    required this.priority,
    this.parentId,
    this.caption,
    this.status = TaskStatus.isNew,
    this.subtasksIds,
    this.dependsIds,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deadline": deadline.toString(),
        "labor": labor,
        "priority": priority,
        "subtasksIds": subtasksIds,
      };
}
