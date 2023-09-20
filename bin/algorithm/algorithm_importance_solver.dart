import 'algorithm_item_model.dart';

/// Алгоритм вычисления самых важных задач
class AlgorithmImportanceSolver {
  AlgorithmImportanceSolver({
    required this.algorithmItems,
  });

  /// Задачи для планирования
  final List<AlgorithmItem> algorithmItems;
  static final DateTime now = DateTime.parse("2022-09-01 09:00");

  /// Получить идентификаторы самых важных задач
  List<int> getIdsMostImportantTasks([int tasksCount = 3]) {
    final items = _getAlgorithmItemsWithImportance();

    if (items.length <= tasksCount) {
      return items.values.map((item) => item.id).toList();
    }

    print('------------------');
    items.forEach((key, value) {
      print('id: ${value.id},\timportance: $key');
    });
    print('------------------');

    final itemsSortedImportances = items.keys.toList();
    itemsSortedImportances.sort();
    final lastTasksCount = itemsSortedImportances
        .sublist(itemsSortedImportances.length - tasksCount)
        .reversed;

    return lastTasksCount.map((key) => items[key]!.id).toList();
  }

  /// Получить задачи с их коэфициентом важности
  Map<double, AlgorithmItem> _getAlgorithmItemsWithImportance() {
    return {for (final item in algorithmItems) _findImportance(item): item};
  }

  /// Получить важность задачи
  static double _findImportance(AlgorithmItem item) {
    return (item.priority + item.dependsPriority + _laborToHours(item.labor)) /
        (_findSecondsBetweenDates(now, item.deadline) + 1);
    //(_findSecondsBetweenDates(DateTime.now(), item.deadline) + 1);
  }

  /// Получить разницу между датами в секундах
  static int _findSecondsBetweenDates(DateTime first, DateTime second) {
    return second.difference(first).inSeconds;
  }

  static double _laborToHours(double labor) => labor / 60 / 60;
}
