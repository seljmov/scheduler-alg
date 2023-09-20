import '../task/task_model.dart';
import '../task/task_priority.dart';
import 'algorithm_item_model.dart';

/// Подготовщик данных для планирования
class AlgorithmDataPreparer {
  const AlgorithmDataPreparer({
    required this.tasks,
  });

  /// Задачи для планирования
  final List<TaskModel> tasks;

  /// Получить данные
  List<AlgorithmItem> getData() {
    return _preparingDataForAlgorithm(tasks).toList();
  }

  /// Подготовка данных для планирования
  static Iterable<AlgorithmItem> _preparingDataForAlgorithm(
    List<TaskModel> tasks,
  ) {
    final tasksDependsPriorities = _getTasksDependsPriorities(tasks);
    final taskForPlanning = _getTasksForPlanning(tasks).toList();
    return taskForPlanning
        .map((task) => AlgorithmItem(
            id: task.id,
            deadline: task.deadline,
            labor: task.labor,
            priority: task.priority.toNumber(),
            dependsPriority: tasksDependsPriorities[task.id] ?? 0,
            dependIds: task.dependIds))
        .toList();
  }

  /// Получить данные, которые можно запланировать
  static Iterable<TaskModel> _getTasksForPlanning(List<TaskModel> tasks) {
    final tasksIds = tasks.map((task) => task.id);
    return tasks.where(
      (task) => task.dependIds.where((id) => tasksIds.contains(id)).isEmpty,
    );
  }

  /// Получить идентификаторы заказов, от которых зависят другие заказы с их приоритетом зависимости
  static Map<int, int> _getTasksDependsPriorities(List<TaskModel> tasks) {
    final hasDependIds = tasks
        .where((task) => task.dependIds.isNotEmpty)
        .map((task) => task.dependIds)
        .reduce((value, element) => value + element);

    // Количество зависимостей для каждого идентификатора
    final dependIdCount = hasDependIds.fold<Map<int, int>>(
      {},
      (map, id) => map..update(id, (value) => value + 1, ifAbsent: () => 1),
    );

    // Идентификаторы заказов, от которых зависят другие заказы с их приоритетом зависимости
    final dependPrioritiesByTaskId = <int, int>{};
    for (final item in dependIdCount.keys) {
      dependPrioritiesByTaskId[item] = dependIdCount[item]! * 2;
    }

    return dependPrioritiesByTaskId;
  }
}
