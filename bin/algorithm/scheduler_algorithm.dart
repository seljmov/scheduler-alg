import '../task/task_model.dart';
import '../task/task_provider.dart';
import 'algorithm_data_preparer.dart';
import 'algorithm_importance_solver.dart';

/// Алгоритм планирования
class SchedulerAlgorithm {
  const SchedulerAlgorithm({
    required this.tasks,
  });

  /// Задачи для планирования
  final List<TaskModel> tasks;

  List<TaskModel> run() {
    final dataPreparer = AlgorithmDataPreparer(tasks: tasks);
    final algorithmItems = dataPreparer.getData();

    final solver = AlgorithmImportanceSolver(algorithmItems: algorithmItems);
    final mostImportantTasksIds = solver.getIdsMostImportantTasks();

    final resultTasks = mostImportantTasksIds
        .map((id) => TaskProvider().getTaskById(id)!)
        .toList();

    for (final task in resultTasks) {
      print(task.toJson());
    }

    return [];
  }
}
