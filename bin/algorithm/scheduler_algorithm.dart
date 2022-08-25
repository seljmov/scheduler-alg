import '../task_model.dart';
import 'algorithm_data_preparer.dart';

/// Алгоритм планирования
class SchedulerAlgorithm {
  const SchedulerAlgorithm({
    required this.tasks,
  });

  /// Задачи для планирования
  final List<TaskModel> tasks;

  /// Начать планирование
  void run() {
    final dataPreparer = AlgorithmDataPreparer(tasks: tasks);
    var algorithmItems = dataPreparer.getData();
  }
}
