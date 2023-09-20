/// Приоритет задачи
enum TaskPriority {
  /// Очень низкий
  extraLow,

  /// Низкий
  low,

  /// Средний
  medium,

  /// Высокий
  high,

  /// Очень высокий
  extraHigh,
}

/// Расширение для преобразования в число
extension ToNumber on TaskPriority {
  /// Преобразовать в число
  int toNumber() => _taskPriorityToNumber[this] ?? 0;
}

Map<TaskPriority, int> _taskPriorityToNumber = {
  TaskPriority.extraLow: 1,
  TaskPriority.low: 3,
  TaskPriority.medium: 7,
  TaskPriority.high: 13,
  TaskPriority.extraHigh: 21,
};
