import 'dart:collection';

import '../task_model.dart';
import '../task_provider.dart';
import 'algorithm_item_model.dart';

/// Алгоритм планирования
class SchedulerAlgorithm {
  /// Задачи для планирования
  final List<Task> tasks;

  SchedulerAlgorithm({required this.tasks});

  /// Начать планирование
  void run() {
    var algItems = _preparingDataForAlgorithm();
    print("Hello world!");
  }

  /// Подготовка данных для планирования
  List<AlgorithmItem> _preparingDataForAlgorithm() {
    var queue = Queue<Task>.from(tasks);
    var output = <AlgorithmItem>[];

    for (var i = 0; i < queue.length; ++i) {
      var task = queue.elementAt(i);

      // Если у задачи есть подзадачи, то для планирования добавить их, а не родителя
      if (task.subtasksIds != null) {
        for (var subtaskId in task.subtasksIds!) {
          // TODO: Уменьшить кол-во обращений к провайдеру
          var subtask = TaskProvider().getTaskById(subtaskId);
          // Добавить в конец очереди для обхода дерева задач
          if (subtask != null) queue.addLast(subtask);
        }
        continue;
      }

      var algItem = AlgorithmItem(
        id: task.id,
        parentId: task.parentId,
        deadline: task.deadline,
        labor: task.labor,
        priority: task.priority,
        dependsIds: task.dependsIds,
      );
      output.add(algItem);
    }
    return output;
  }
}
