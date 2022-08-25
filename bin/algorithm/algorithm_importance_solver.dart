import 'algorithm_item_model.dart';

/// Алгоритм вычисления самых важных задач
class AlgorithmImportanceSolver {
  const AlgorithmImportanceSolver({
    required this.algorithmItems,
  });

  /// Задачи для планирования
  final List<AlgorithmItem> algorithmItems;

  /// Получить идентификаторы самых важных задач
  List<int> getIdsMostImportantTasks([int tasksCount = 3]) {
    var items = _getAlgorithmItemsWithImportance();
    var itemsSortedImportances = items.keys.toList();
    itemsSortedImportances.sort();
    var taskIds =
        itemsSortedImportances.reversed.toList().sublist(0, tasksCount);

    return taskIds.map((key) => items[key]!.id).toList();
  }

  /// Получить задачи с их коэфициентом важности
  Map<double, AlgorithmItem> _getAlgorithmItemsWithImportance() {
    return {for (final item in algorithmItems) _findImportance(item): item};
  }

  /// Получить важность задачи
  static double _findImportance(AlgorithmItem item) {
    return (2 * item.priority + item.labor + 2 * item.dependsPriority) /
        (2 * _findHoursBetweenDates(DateTime.now(), item.deadline));
  }

  /// Получить разницу между датами в часах
  static double _findHoursBetweenDates(DateTime first, DateTime second) {
    return second.difference(first).inMinutes / 60;
  }
}
