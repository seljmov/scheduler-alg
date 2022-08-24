import '../task_model.dart';
import 'algorithm_item_model.dart';

/// Алгоритм планирования
class SchedulerAlgorithm {
  const SchedulerAlgorithm({
    required this.tasks,
  });

  /// Задачи для планирования
  final List<Task> tasks;

  /// Начать планирование
  void run() {
    var algItems = _preparingDataForAlgorithm(tasks);
  }

  /// Подготовка данных для планирования
  static List<AlgorithmItem> _preparingDataForAlgorithm(List<Task> tasks) {
    return tasks
        .map((task) => AlgorithmItem(
              id: task.id,
              deadline: task.deadline,
              labor: task.labor,
              priority: task.priority,
              dependsIds: task.dependsIds,
            ))
        .toList();
  }
}
