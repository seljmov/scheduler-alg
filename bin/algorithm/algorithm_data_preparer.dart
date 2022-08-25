import '../task_model.dart';
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
    var tasksDependsPriorities = _getTasksDependsPriorities(tasks);
    var taskForPlanning = _getTasksForPlanning(tasks).toList();
    return taskForPlanning
        .map((task) => AlgorithmItem(
              id: task.id,
              deadline: task.deadline,
              labor: task.labor,
              priority: task.priority,
              dependsPriority: tasksDependsPriorities[task.id]!,
              dependsIds: task.dependsIds,
            ))
        .toList();
  }

  /// Получить данные, которые можно запланировать
  static Iterable<TaskModel> _getTasksForPlanning(List<TaskModel> tasks) {
    var tasksIds = tasks.map((task) => task.id);
    return tasks.where(
      (task) => task.dependsIds.where((id) => tasksIds.contains(id)).isEmpty,
    );
  }

  /// Получить идентификаторы заказов, от которых зависят другие заказы с их приоритетом зависимости
  static Map<int, int> _getTasksDependsPriorities(List<TaskModel> tasks) {
    var dependsPriorities = {for (final task in tasks) task.id: 0};
    var tasksByIds = {for (final task in tasks) task.id: task};

    final isDependsIds = tasks
        .where((task) => task.dependsIds.isNotEmpty)
        .map((task) => task.dependsIds)
        .reduce((value, element) => value + element);

    for (final dependsId in isDependsIds) {
      if (tasksByIds.containsKey(dependsId)) {
        dependsPriorities[dependsId] = dependsPriorities[dependsId]! + 1;
      }
    }

    return dependsPriorities;
  }
}
