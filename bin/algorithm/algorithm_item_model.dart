/// Элемент алгоритма
class AlgorithmItem {
  /// Идентификатор задачи
  final int id;

  /// Дедлайн
  final DateTime deadline;

  /// Трудоёмкость в секундах
  final double labor;

  /// Приоритет
  final int priority;

  /// Приоритет зависимости
  final int dependsPriority;

  /// Идентификаторы зависимых задач
  final List<int> dependIds;

  /// Конструктор
  AlgorithmItem({
    required this.id,
    required this.deadline,
    required this.labor,
    required this.priority,
    this.dependsPriority = 0,
    this.dependIds = const <int>[],
  });

  /// Преобразовать в JSON
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "deadline": deadline.toIso8601String(),
      "labor": labor,
      "priority": priority,
      "dependsPriority": dependsPriority,
      "dependIds": dependIds,
    };
  }

  /// Преобразовать в строку
  @override
  String toString() => 'AlgorithmItem(${toJson().toString()})';
}
