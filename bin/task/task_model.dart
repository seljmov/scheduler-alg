import 'task_priority.dart';
import 'task_status.dart';

/// Задача
class TaskModel {
  /// Идентификатор
  final int id;

  /// Название
  final String name;

  /// Описание
  final String description;

  /// Дата дедлайна
  final DateTime deadline;

  /// Трудоёмкость в секундах
  final double labor;

  /// Приоритет
  final TaskPriority priority;

  /// Текущий статус
  final String status;

  /// Идентификаторы подзадач
  final List<int> subtasksIds;

  /// Идентификаторы зависимых задач
  final List<int> dependIds;

  /// Конструктор
  TaskModel({
    required this.id,
    required this.name,
    required this.deadline,
    this.labor = 0,
    this.priority = TaskPriority.extraLow,
    this.description = "",
    this.status = TaskStatus.isNew,
    this.subtasksIds = const <int>[],
    this.dependIds = const <int>[],
  });

  /// Преобразовать в JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "deadline": deadline.toIso8601String(),
      "labor": labor,
      "priority": priority,
      "status": status,
      "subtasksIds": subtasksIds,
      "dependIds": dependIds,
    };
  }

  /// Преобразовать в строку
  @override
  String toString() => 'TaskModel(${toJson().toString()})';
}
